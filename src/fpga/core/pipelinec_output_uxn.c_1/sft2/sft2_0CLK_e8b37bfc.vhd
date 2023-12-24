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
entity sft2_0CLK_e8b37bfc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sft2_0CLK_e8b37bfc;
architecture arch of sft2_0CLK_e8b37bfc is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2268_c6_f0cc]
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2268_c2_d656]
signal n16_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2268_c2_d656]
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2268_c2_d656]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2268_c2_d656]
signal t8_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2281_c11_125c]
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal n16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2281_c7_47a6]
signal t8_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_30b4]
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2284_c7_7178]
signal n16_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2284_c7_7178]
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_7178]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_7178]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_7178]
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_7178]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2284_c7_7178]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l2284_c7_7178]
signal t8_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2288_c11_4bd6]
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2288_c7_fd47]
signal n16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2288_c7_fd47]
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2288_c7_fd47]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2288_c7_fd47]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2288_c7_fd47]
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2288_c7_fd47]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2288_c7_fd47]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l2290_c3_b335]
signal CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2292_c11_0e00]
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2292_c7_5ebf]
signal n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2292_c7_5ebf]
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c7_5ebf]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c7_5ebf]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2292_c7_5ebf]
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c7_5ebf]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c7_5ebf]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2293_c3_2898]
signal BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2294_c30_de46]
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_return_output : signed(3 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l2295_c20_6be0]
signal BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_return_output : unsigned(7 downto 0);

-- BIN_OP_SR[uxn_opcodes_h_l2295_c12_f7f8]
signal BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_left : unsigned(15 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_right : unsigned(7 downto 0);
signal BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_return_output : unsigned(15 downto 0);

-- CONST_SR_4[uxn_opcodes_h_l2295_c36_e976]
signal CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_x : unsigned(7 downto 0);
signal CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_return_output : unsigned(7 downto 0);

-- BIN_OP_SL[uxn_opcodes_h_l2295_c12_1c9d]
signal BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_left : unsigned(15 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_right : unsigned(7 downto 0);
signal BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2300_c11_c029]
signal BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2300_c7_6ba1]
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2300_c7_6ba1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2300_c7_6ba1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2300_c7_6ba1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2303_c31_6892]
signal CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_left,
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_right,
BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output);

-- n16_MUX_uxn_opcodes_h_l2268_c2_d656
n16_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
n16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
n16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
n16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2268_c2_d656
tmp16_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- t8_MUX_uxn_opcodes_h_l2268_c2_d656
t8_MUX_uxn_opcodes_h_l2268_c2_d656 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2268_c2_d656_cond,
t8_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue,
t8_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse,
t8_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_left,
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_right,
BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output);

-- n16_MUX_uxn_opcodes_h_l2281_c7_47a6
n16_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
n16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6
tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- t8_MUX_uxn_opcodes_h_l2281_c7_47a6
t8_MUX_uxn_opcodes_h_l2281_c7_47a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2281_c7_47a6_cond,
t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue,
t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse,
t8_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_left,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_right,
BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output);

-- n16_MUX_uxn_opcodes_h_l2284_c7_7178
n16_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
n16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
n16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
n16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2284_c7_7178
tmp16_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- t8_MUX_uxn_opcodes_h_l2284_c7_7178
t8_MUX_uxn_opcodes_h_l2284_c7_7178 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l2284_c7_7178_cond,
t8_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue,
t8_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse,
t8_MUX_uxn_opcodes_h_l2284_c7_7178_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_left,
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_right,
BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output);

-- n16_MUX_uxn_opcodes_h_l2288_c7_fd47
n16_MUX_uxn_opcodes_h_l2288_c7_fd47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond,
n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue,
n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse,
n16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47
tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond,
tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue,
tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse,
tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_cond,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output);

-- CONST_SL_8_uxn_opcodes_h_l2290_c3_b335
CONST_SL_8_uxn_opcodes_h_l2290_c3_b335 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_x,
CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_left,
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_right,
BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output);

-- n16_MUX_uxn_opcodes_h_l2292_c7_5ebf
n16_MUX_uxn_opcodes_h_l2292_c7_5ebf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond,
n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue,
n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse,
n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf
tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond,
tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue,
tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse,
tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond,
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898
BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_left,
BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_right,
BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2294_c30_de46
sp_relative_shift_uxn_opcodes_h_l2294_c30_de46 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_ins,
sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_x,
sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_y,
sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0
BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_left,
BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_right,
BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_return_output);

-- BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8
BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8 : entity work.BIN_OP_SR_uint16_t_uint8_t_0CLK_295015b8 port map (
BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_left,
BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_right,
BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_return_output);

-- CONST_SR_4_uxn_opcodes_h_l2295_c36_e976
CONST_SR_4_uxn_opcodes_h_l2295_c36_e976 : entity work.CONST_SR_4_uint8_t_0CLK_de264c78 port map (
CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_x,
CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_return_output);

-- BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d
BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d : entity work.BIN_OP_SL_uint16_t_uint8_t_0CLK_b6546dec port map (
BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_left,
BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_right,
BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_left,
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_right,
BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond,
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2303_c31_6892
CONST_SR_8_uxn_opcodes_h_l2303_c31_6892 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_x,
CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output,
 n16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 t8_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output,
 n16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 t8_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output,
 n16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 t8_MUX_uxn_opcodes_h_l2284_c7_7178_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output,
 n16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output,
 tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output,
 CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output,
 n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output,
 tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output,
 sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_return_output,
 BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_return_output,
 BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_return_output,
 CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_return_output,
 BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output,
 CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2273_c3_3a63 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_97dd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_fa50 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_cd4d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2297_c3_616c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_left : unsigned(15 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_right : unsigned(7 downto 0);
 variable VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_x : unsigned(7 downto 0);
 variable VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2298_c21_d7d4_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2301_c3_33a5 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_9cae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2303_c21_18b9_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_b44c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_2719_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_b9d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_0b02_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2307_l2263_DUPLICATE_cc0d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_9cae := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2302_c3_9cae;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_right := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_y := resize(to_signed(-1, 2), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_fa50 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2282_c3_fa50;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2273_c3_3a63 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2273_c3_3a63;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_right := to_unsigned(15, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_cd4d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2286_c3_cd4d;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2301_c3_33a5 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2301_c3_33a5;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2297_c3_616c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2297_c3_616c;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_97dd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2278_c3_97dd;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_left := t8;
     VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_x := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := t8;
     VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse := tmp16;
     -- CONST_SR_4[uxn_opcodes_h_l2295_c36_e976] LATENCY=0
     -- Inputs
     CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_x <= VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_x;
     -- Outputs
     VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_return_output := CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l2303_c31_6892] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_return_output := CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2268_c6_f0cc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_left;
     BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output := BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2268_c2_d656_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2268_c2_d656_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_0b02 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_0b02_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_b44c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_b44c_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2281_c11_125c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_left;
     BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output := BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2268_c2_d656_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_2719 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_2719_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2268_c2_d656_return_output := result.is_pc_updated;

     -- BIN_OP_AND[uxn_opcodes_h_l2295_c20_6be0] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_left;
     BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_return_output := BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2284_c11_30b4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_left;
     BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output := BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2300_c11_c029] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_left;
     BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output := BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2294_c30_de46] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_ins;
     sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_x;
     sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_return_output := sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1_return_output := result.u8_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_b9d8 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_b9d8_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2292_c11_0e00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_left;
     BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output := BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2288_c11_4bd6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;

     -- Submodule level 1
     VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_right := VAR_BIN_OP_AND_uxn_opcodes_h_l2295_c20_6be0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2268_c6_f0cc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2281_c11_125c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2284_c11_30b4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2288_c11_4bd6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2292_c11_0e00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2300_c11_c029_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_b9d8_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2293_l2289_DUPLICATE_b9d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_b44c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_b44c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_b44c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2284_l2300_l2288_l2281_DUPLICATE_b44c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2300_l2292_l2288_l2284_l2281_DUPLICATE_5703_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_2719_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_2719_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_2719_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2284_l2288_l2281_l2292_DUPLICATE_2719_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_0b02_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2300_l2288_DUPLICATE_0b02_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2268_l2300_l2288_l2284_l2281_DUPLICATE_15d1_return_output;
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_right := VAR_CONST_SR_4_uxn_opcodes_h_l2295_c36_e976_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2268_c2_d656_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2268_c2_d656_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2268_c2_d656_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2268_c2_d656_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2294_c30_de46_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- t8_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     t8_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     t8_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := t8_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2293_c3_2898] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_left;
     BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output := BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2300_c7_6ba1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2303_c21_18b9] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2303_c21_18b9_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2303_c31_6892_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2300_c7_6ba1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2300_c7_6ba1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2292_c7_5ebf] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l2290_c3_b335] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_x <= VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_return_output := CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_return_output;

     -- Submodule level 2
     VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2293_c3_2898_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2303_c21_18b9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l2290_c3_b335_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     -- t8_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := t8_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2288_c7_fd47] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2300_c7_6ba1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output := result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2292_c7_5ebf] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;

     -- BIN_OP_SR[uxn_opcodes_h_l2295_c12_f7f8] LATENCY=0
     -- Inputs
     BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_left <= VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_left;
     BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_right <= VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_right;
     -- Outputs
     VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_return_output := BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_return_output;

     -- n16_MUX[uxn_opcodes_h_l2292_c7_5ebf] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond;
     n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue;
     n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output := n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2292_c7_5ebf] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2292_c7_5ebf] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;

     -- Submodule level 3
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_left := VAR_BIN_OP_SR_uxn_opcodes_h_l2295_c12_f7f8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2300_c7_6ba1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_t8_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     -- n16_MUX[uxn_opcodes_h_l2288_c7_fd47] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond <= VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond;
     n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue;
     n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output := n16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2288_c7_fd47] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;

     -- t8_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     t8_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     t8_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := t8_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2288_c7_fd47] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2288_c7_fd47] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;

     -- BIN_OP_SL[uxn_opcodes_h_l2295_c12_1c9d] LATENCY=0
     -- Inputs
     BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_left <= VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_left;
     BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_right <= VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_right;
     -- Outputs
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output := BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output;

     -- Submodule level 4
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue := VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2298_c21_d7d4] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2298_c21_d7d4_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_SL_uxn_opcodes_h_l2295_c12_1c9d_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2292_c7_5ebf] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond;
     tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output := tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;

     -- n16_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     n16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     n16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := n16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- Submodule level 5
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2298_c21_d7d4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2292_c7_5ebf] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output := result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- n16_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := n16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2288_c7_fd47] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_cond;
     tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output := tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2292_c7_5ebf_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;
     -- n16_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     n16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     n16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := n16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2288_c7_fd47] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output := result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2288_c7_fd47_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2284_c7_7178] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_return_output := result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2284_c7_7178_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2281_c7_47a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2281_c7_47a6_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2268_c2_d656] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_return_output := result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2307_l2263_DUPLICATE_cc0d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2307_l2263_DUPLICATE_cc0d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a47b(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2268_c2_d656_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2268_c2_d656_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2307_l2263_DUPLICATE_cc0d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a47b_uxn_opcodes_h_l2307_l2263_DUPLICATE_cc0d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
