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
entity sub2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end sub2_0CLK_50b92fe2;
architecture arch of sub2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_9135]
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_e240]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2496_c2_e240]
signal n16_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2496_c2_e240]
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2496_c2_e240]
signal t16_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_1514]
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal n16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2509_c7_d42c]
signal t16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_8cf2]
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_da23]
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_da23]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_da23]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_da23]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_da23]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2512_c7_da23]
signal n16_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2512_c7_da23]
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2512_c7_da23]
signal t16_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_d346]
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_7741]
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_7741]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_7741]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_7741]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_7741]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2517_c7_7741]
signal n16_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2517_c7_7741]
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l2517_c7_7741]
signal t16_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2518_c3_150e]
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_4cbb]
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_54f9]
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_54f9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_54f9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_54f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_54f9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2521_c7_54f9]
signal n16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2521_c7_54f9]
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_3415]
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_35c9]
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_35c9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_35c9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_35c9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_35c9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l2525_c7_35c9]
signal n16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(15 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l2525_c7_35c9]
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l2526_c3_38f7]
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output : unsigned(15 downto 0);

-- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_018b]
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_left : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_right : unsigned(15 downto 0);
signal BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2528_c30_61ff]
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_d9d3]
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_2fd9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_2fd9]
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_2fd9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_2fd9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l2536_c31_d820]
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_left,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_right,
BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- n16_MUX_uxn_opcodes_h_l2496_c2_e240
n16_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
n16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
n16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
n16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2496_c2_e240
tmp16_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- t16_MUX_uxn_opcodes_h_l2496_c2_e240
t16_MUX_uxn_opcodes_h_l2496_c2_e240 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2496_c2_e240_cond,
t16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue,
t16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse,
t16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_left,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_right,
BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- n16_MUX_uxn_opcodes_h_l2509_c7_d42c
n16_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
n16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c
tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- t16_MUX_uxn_opcodes_h_l2509_c7_d42c
t16_MUX_uxn_opcodes_h_l2509_c7_d42c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond,
t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue,
t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse,
t16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_left,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_right,
BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- n16_MUX_uxn_opcodes_h_l2512_c7_da23
n16_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
n16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
n16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
n16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2512_c7_da23
tmp16_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- t16_MUX_uxn_opcodes_h_l2512_c7_da23
t16_MUX_uxn_opcodes_h_l2512_c7_da23 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2512_c7_da23_cond,
t16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue,
t16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse,
t16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_left,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_right,
BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- n16_MUX_uxn_opcodes_h_l2517_c7_7741
n16_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
n16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
n16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
n16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2517_c7_7741
tmp16_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- t16_MUX_uxn_opcodes_h_l2517_c7_7741
t16_MUX_uxn_opcodes_h_l2517_c7_7741 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l2517_c7_7741_cond,
t16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue,
t16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse,
t16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e
BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_left,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_right,
BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_left,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_right,
BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output);

-- n16_MUX_uxn_opcodes_h_l2521_c7_54f9
n16_MUX_uxn_opcodes_h_l2521_c7_54f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond,
n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue,
n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse,
n16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9
tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond,
tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_left,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_right,
BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output);

-- n16_MUX_uxn_opcodes_h_l2525_c7_35c9
n16_MUX_uxn_opcodes_h_l2525_c7_35c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond,
n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue,
n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse,
n16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output);

-- tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9
tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond,
tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue,
tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse,
tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7
BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_left,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_right,
BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output);

-- BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b : entity work.BIN_OP_MINUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_left,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_right,
BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff
sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_ins,
sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_x,
sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_y,
sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_left,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_right,
BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output);

-- CONST_SR_8_uxn_opcodes_h_l2536_c31_d820
CONST_SR_8_uxn_opcodes_h_l2536_c31_d820 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_x,
CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 n16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 t16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 n16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 t16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 n16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 t16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 n16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 t16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output,
 n16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output,
 n16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output,
 tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output,
 BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output,
 sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output,
 CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_2f0e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_bf89 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_d21e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_c05d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_7873 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_41c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_3d47_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_d4d3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_ac4a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_9687_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2518_l2513_l2526_DUPLICATE_1fcd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_efcb_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2492_l2540_DUPLICATE_8e11_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_2f0e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2506_c3_2f0e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_right := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_right := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_bf89 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2501_c3_bf89;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_right := to_unsigned(5, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_7873 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2519_c3_7873;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_c05d := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2515_c3_c05d;
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_ac4a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2535_c3_ac4a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_d21e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2510_c3_d21e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_d4d3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2534_c3_d4d3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_41c5 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2530_c3_41c5;
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_y := resize(to_signed(-2, 3), 4);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_left := VAR_phase;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l2512_c11_8cf2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_left;
     BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output := BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_e240_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2517_c11_d346] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_left;
     BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output := BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_e240_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l2536_c31_d820] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_x <= VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_return_output := CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2528_c30_61ff] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_ins;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_x;
     sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_return_output := sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_efcb LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_efcb_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2525_c11_3415] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_left;
     BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output := BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_e240_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l2509_c11_1514] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_left;
     BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output := BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2496_c6_9135] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_left;
     BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output := BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_e240_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2533_c11_d9d3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2518_l2513_l2526_DUPLICATE_1fcd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2518_l2513_l2526_DUPLICATE_1fcd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l2521_c11_4cbb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2496_c6_9135_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2509_c11_1514_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2512_c11_8cf2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2517_c11_d346_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2521_c11_4cbb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2525_c11_3415_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2533_c11_d9d3_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2518_l2513_l2526_DUPLICATE_1fcd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2518_l2513_l2526_DUPLICATE_1fcd_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l2522_l2518_l2513_l2526_DUPLICATE_1fcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2533_DUPLICATE_5e81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_l2533_DUPLICATE_f04d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2525_l2521_l2517_l2512_l2509_DUPLICATE_fca3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_efcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2533_l2521_DUPLICATE_efcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2521_l2517_l2512_l2509_l2496_l2533_DUPLICATE_d97f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2496_c2_e240_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2496_c2_e240_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2496_c2_e240_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2496_c2_e240_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2528_c30_61ff_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2533_c7_2fd9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2518_c3_150e] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_left;
     BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_return_output := BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l2526_c3_38f7] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_left;
     BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output := BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2533_c7_2fd9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2536_c21_9687] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_9687_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l2536_c31_d820_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2525_c7_35c9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2533_c7_2fd9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2518_c3_150e_return_output;
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l2526_c3_38f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2536_c21_9687_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l2523_l2514_DUPLICATE_e33f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;
     -- n16_MUX[uxn_opcodes_h_l2525_c7_35c9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond;
     n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue;
     n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output := n16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2533_c7_2fd9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     t16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     t16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := t16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- BIN_OP_MINUS[uxn_opcodes_h_l2527_c11_018b] LATENCY=0
     -- Inputs
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_left <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_left;
     BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_right <= VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_right;
     -- Outputs
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output := BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2525_c7_35c9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2525_c7_35c9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2521_c7_54f9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2525_c7_35c9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue := VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2533_c7_2fd9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2521_c7_54f9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     t16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     t16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := t16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2521_c7_54f9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l2531_c21_3d47] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_3d47_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_MINUS_uxn_opcodes_h_l2527_c11_018b_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2521_c7_54f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2521_c7_54f9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond;
     n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue;
     n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output := n16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2525_c7_35c9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_cond;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output := tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l2531_c21_3d47_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- t16_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := t16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2521_c7_54f9] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_cond;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output := tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2525_c7_35c9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;

     -- n16_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     n16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     n16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := n16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2525_c7_35c9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_t16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2521_c7_54f9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;

     -- t16_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     t16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     t16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := t16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     n16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     n16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := n16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2521_c7_54f9_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2517_c7_7741] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_return_output := result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := n16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_n16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2517_c7_7741_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2512_c7_da23] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_return_output := result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- n16_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     n16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     n16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := n16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2512_c7_da23_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2509_c7_d42c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2509_c7_d42c_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2496_c2_e240] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_return_output := result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2492_l2540_DUPLICATE_8e11 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2492_l2540_DUPLICATE_8e11_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2496_c2_e240_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2492_l2540_DUPLICATE_8e11_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l2492_l2540_DUPLICATE_8e11_return_output;
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
