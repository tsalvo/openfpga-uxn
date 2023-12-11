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
entity lda_0CLK_c634cda8 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lda_0CLK_c634cda8;
architecture arch of lda_0CLK_c634cda8 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1417_c6_5be6]
signal BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1417_c2_c8f8]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1430_c11_32ca]
signal BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1430_c7_e9e8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_b111]
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal t16_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_08a2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1435_c3_ab2d]
signal CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_7cd7]
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1437_c7_f475]
signal t16_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(15 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1437_c7_f475]
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_f475]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1437_c7_f475]
signal result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1437_c7_f475]
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1437_c7_f475]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_f475]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_f475]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1438_c3_56d2]
signal BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1439_c30_6a9a]
signal sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_c849]
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1442_c7_027a]
signal tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_027a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1442_c7_027a]
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1442_c7_027a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_027a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_027a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1445_c11_28e6]
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1445_c7_725b]
signal tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1445_c7_725b]
signal result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1445_c7_725b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1445_c7_725b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1445_c7_725b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6
BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_left,
BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_right,
BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output);

-- t16_MUX_uxn_opcodes_h_l1417_c2_c8f8
t16_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8
tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8
result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca
BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_left,
BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_right,
BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output);

-- t16_MUX_uxn_opcodes_h_l1430_c7_e9e8
t16_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8
tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8
result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8
result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8
result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8
result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_left,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_right,
BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output);

-- t16_MUX_uxn_opcodes_h_l1433_c7_08a2
t16_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
t16_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2
tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2
result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d
CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_x,
CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_left,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_right,
BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output);

-- t16_MUX_uxn_opcodes_h_l1437_c7_f475
t16_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
t16_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
t16_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
t16_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1437_c7_f475
tmp8_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475
result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2
BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_left,
BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_right,
BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a
sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_ins,
sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_x,
sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_y,
sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_left,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_right,
BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1442_c7_027a
tmp8_MUX_uxn_opcodes_h_l1442_c7_027a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_cond,
tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue,
tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse,
tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_left,
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_right,
BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1445_c7_725b
tmp8_MUX_uxn_opcodes_h_l1445_c7_725b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_cond,
tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue,
tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse,
tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b
result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output,
 t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output,
 t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output,
 t16_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output,
 CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output,
 t16_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output,
 tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output,
 tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1422_c3_ee3e : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_96da : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1431_c3_8155 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1443_c3_4b10 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_0f18 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1437_l1430_l1433_l1417_DUPLICATE_03f2_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1430_l1442_l1433_DUPLICATE_b81f_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1438_l1434_DUPLICATE_af04_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1442_l1433_l1445_DUPLICATE_4783_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1453_l1412_DUPLICATE_4634_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_y := resize(to_signed(-1, 2), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1443_c3_4b10 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1443_c3_4b10;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_0f18 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1448_c3_0f18;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1431_c3_8155 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1431_c3_8155;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_96da := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1427_c3_96da;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1422_c3_ee3e := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1422_c3_ee3e;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_right := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue := VAR_previous_ram_read;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := t16;
     VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse := tmp8;
     -- sp_relative_shift[uxn_opcodes_h_l1439_c30_6a9a] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_ins;
     sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_x;
     sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_return_output := sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1445_c11_28e6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1437_l1430_l1433_l1417_DUPLICATE_03f2 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1437_l1430_l1433_l1417_DUPLICATE_03f2_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1437_c11_7cd7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1430_c11_32ca] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_left;
     BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output := BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1442_c11_c849] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_left;
     BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output := BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output := result.is_pc_updated;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1430_l1442_l1433_DUPLICATE_b81f LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1430_l1442_l1433_DUPLICATE_b81f_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output := result.is_ram_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1417_c6_5be6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1433_c11_b111] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_left;
     BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output := BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1438_l1434_DUPLICATE_af04 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1438_l1434_DUPLICATE_af04_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1442_l1433_l1445_DUPLICATE_4783 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1442_l1433_l1445_DUPLICATE_4783_return_output := result.stack_address_sp_offset;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1417_c6_5be6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1430_c11_32ca_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1433_c11_b111_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1437_c11_7cd7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1442_c11_c849_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1445_c11_28e6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1438_l1434_DUPLICATE_af04_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1438_l1434_DUPLICATE_af04_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1430_l1442_l1433_DUPLICATE_b81f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1430_l1442_l1433_DUPLICATE_b81f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1430_l1442_l1433_DUPLICATE_b81f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1437_l1430_l1433_l1417_DUPLICATE_03f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1437_l1430_l1433_l1417_DUPLICATE_03f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1437_l1430_l1433_l1417_DUPLICATE_03f2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1437_l1430_l1433_l1417_DUPLICATE_03f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_66ba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_DUPLICATE_b460_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1442_l1433_l1445_DUPLICATE_4783_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1442_l1433_l1445_DUPLICATE_4783_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1442_l1433_l1445_DUPLICATE_4783_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1437_l1442_l1433_l1445_DUPLICATE_4783_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1445_l1442_l1437_l1433_l1430_l1417_DUPLICATE_46b8_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1417_c2_c8f8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1439_c30_6a9a_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1445_c7_725b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1435_c3_ab2d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_return_output := CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1442_c7_027a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1445_c7_725b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1445_c7_725b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1445_c7_725b] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_cond;
     tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_return_output := tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1445_c7_725b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1438_c3_56d2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_left;
     BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output := BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1438_c3_56d2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1435_c3_ab2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1445_c7_725b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1442_c7_027a] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_cond;
     tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_return_output := tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1442_c7_027a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1442_c7_027a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1442_c7_027a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1442_c7_027a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     t16_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     t16_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := t16_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1442_c7_027a_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- t16_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := t16_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1437_c7_f475] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_cond;
     tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_return_output := tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1437_c7_f475_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- t16_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1433_c7_08a2] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_cond;
     tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output := tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1433_c7_08a2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- t16_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1430_c7_e9e8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_cond;
     tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output := tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1430_c7_e9e8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1417_c2_c8f8] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_cond;
     tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output := tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;

     -- Submodule level 7
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1453_l1412_DUPLICATE_4634 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1453_l1412_DUPLICATE_4634_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1417_c2_c8f8_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1453_l1412_DUPLICATE_4634_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1453_l1412_DUPLICATE_4634_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
