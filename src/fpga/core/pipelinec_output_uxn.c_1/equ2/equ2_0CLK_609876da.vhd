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
entity equ2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end equ2_0CLK_609876da;
architecture arch of equ2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_0875]
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal t16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal n16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1220_c2_ba83]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_fad4]
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1233_c7_a77d]
signal t16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1233_c7_a77d]
signal n16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_a77d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_a77d]
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_a77d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_a77d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_a77d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_59af]
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1236_c7_9f7a]
signal t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1236_c7_9f7a]
signal n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_9f7a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1236_c7_9f7a]
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_9f7a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_9f7a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_9f7a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_dd6d]
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l1241_c7_f14c]
signal t16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l1241_c7_f14c]
signal n16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_f14c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_f14c]
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_f14c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_f14c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_f14c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1242_c3_c515]
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_39c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1245_c7_1232]
signal n16_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_1232]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1245_c7_1232]
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_1232]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_1232]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_1232]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_e9f5]
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1249_c7_e9ff]
signal n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_e9ff]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1249_c7_e9ff]
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_e9ff]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_e9ff]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_e9ff]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1250_c3_9f60]
signal BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1251_c30_f0bc]
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1254_c21_9b5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1254_c21_7c12]
signal MUX_uxn_opcodes_h_l1254_c21_7c12_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1254_c21_7c12_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1254_c21_7c12_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1254_c21_7c12_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_84a2( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_vram_write := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_pc_updated := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_left,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_right,
BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output);

-- t16_MUX_uxn_opcodes_h_l1220_c2_ba83
t16_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
t16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- n16_MUX_uxn_opcodes_h_l1220_c2_ba83
n16_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
n16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_left,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_right,
BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output);

-- t16_MUX_uxn_opcodes_h_l1233_c7_a77d
t16_MUX_uxn_opcodes_h_l1233_c7_a77d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond,
t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue,
t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse,
t16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output);

-- n16_MUX_uxn_opcodes_h_l1233_c7_a77d
n16_MUX_uxn_opcodes_h_l1233_c7_a77d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond,
n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue,
n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse,
n16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_left,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_right,
BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output);

-- t16_MUX_uxn_opcodes_h_l1236_c7_9f7a
t16_MUX_uxn_opcodes_h_l1236_c7_9f7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond,
t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue,
t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse,
t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output);

-- n16_MUX_uxn_opcodes_h_l1236_c7_9f7a
n16_MUX_uxn_opcodes_h_l1236_c7_9f7a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond,
n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue,
n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse,
n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_left,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_right,
BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output);

-- t16_MUX_uxn_opcodes_h_l1241_c7_f14c
t16_MUX_uxn_opcodes_h_l1241_c7_f14c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond,
t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue,
t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse,
t16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output);

-- n16_MUX_uxn_opcodes_h_l1241_c7_f14c
n16_MUX_uxn_opcodes_h_l1241_c7_f14c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond,
n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue,
n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse,
n16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515
BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_left,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_right,
BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output);

-- n16_MUX_uxn_opcodes_h_l1245_c7_1232
n16_MUX_uxn_opcodes_h_l1245_c7_1232 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1245_c7_1232_cond,
n16_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue,
n16_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse,
n16_MUX_uxn_opcodes_h_l1245_c7_1232_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_cond,
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_left,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_right,
BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output);

-- n16_MUX_uxn_opcodes_h_l1249_c7_e9ff
n16_MUX_uxn_opcodes_h_l1249_c7_e9ff : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond,
n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue,
n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse,
n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond,
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60
BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_left,
BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_right,
BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc
sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_ins,
sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_x,
sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_y,
sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_return_output);

-- MUX_uxn_opcodes_h_l1254_c21_7c12
MUX_uxn_opcodes_h_l1254_c21_7c12 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1254_c21_7c12_cond,
MUX_uxn_opcodes_h_l1254_c21_7c12_iftrue,
MUX_uxn_opcodes_h_l1254_c21_7c12_iffalse,
MUX_uxn_opcodes_h_l1254_c21_7c12_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output,
 t16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 n16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output,
 t16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output,
 n16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output,
 t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output,
 n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output,
 t16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output,
 n16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output,
 n16_MUX_uxn_opcodes_h_l1245_c7_1232_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output,
 n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output,
 sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_return_output,
 MUX_uxn_opcodes_h_l1254_c21_7c12_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1225_c3_53cd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_9be2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_47b1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_7f00 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_851f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1253_c3_c5dc : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1250_l1246_l1242_DUPLICATE_8a0d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1245_l1249_DUPLICATE_51aa_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1258_l1216_DUPLICATE_2114_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1225_c3_53cd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1225_c3_53cd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_47b1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1234_c3_47b1;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1253_c3_c5dc := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1253_c3_c5dc;
     VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_7f00 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1239_c3_7f00;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_9be2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1230_c3_9be2;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_851f := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1243_c3_851f;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse := t16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1236_c11_59af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0_return_output := result.sp_relative_shift;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1249_c11_e9f5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1220_c6_0875] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_left;
     BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output := BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1233_c11_fad4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output := result.u8_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1245_l1249_DUPLICATE_51aa LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1245_l1249_DUPLICATE_51aa_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1245_c11_39c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1251_c30_f0bc] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_ins;
     sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_x;
     sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_return_output := sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1250_l1246_l1242_DUPLICATE_8a0d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1250_l1246_l1242_DUPLICATE_8a0d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1241_c11_dd6d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1220_c6_0875_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1233_c11_fad4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1236_c11_59af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1241_c11_dd6d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1245_c11_39c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1249_c11_e9f5_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1250_l1246_l1242_DUPLICATE_8a0d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1250_l1246_l1242_DUPLICATE_8a0d_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1237_l1250_l1246_l1242_DUPLICATE_8a0d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_99b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_2ec6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1233_l1249_l1245_l1241_l1236_DUPLICATE_279d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1245_l1249_DUPLICATE_51aa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1245_l1249_DUPLICATE_51aa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1233_l1220_l1249_l1245_l1241_l1236_DUPLICATE_c8ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1220_c2_ba83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1251_c30_f0bc_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1249_c7_e9ff] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1250_c3_9f60] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_left;
     BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output := BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1249_c7_e9ff] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1249_c7_e9ff] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1249_c7_e9ff] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1242_c3_c515] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_left;
     BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_return_output := BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1242_c3_c515_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1250_c3_9f60_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1238_l1247_DUPLICATE_7698_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;
     -- n16_MUX[uxn_opcodes_h_l1249_c7_e9ff] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond;
     n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue;
     n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output := n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1254_c21_9b5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_return_output;

     -- t16_MUX[uxn_opcodes_h_l1241_c7_f14c] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond;
     t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue;
     t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output := t16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1245_c7_1232] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1245_c7_1232] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1245_c7_1232] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1245_c7_1232] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1254_c21_9b5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;
     -- MUX[uxn_opcodes_h_l1254_c21_7c12] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1254_c21_7c12_cond <= VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_cond;
     MUX_uxn_opcodes_h_l1254_c21_7c12_iftrue <= VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_iftrue;
     MUX_uxn_opcodes_h_l1254_c21_7c12_iffalse <= VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_return_output := MUX_uxn_opcodes_h_l1254_c21_7c12_return_output;

     -- t16_MUX[uxn_opcodes_h_l1236_c7_9f7a] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond;
     t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue;
     t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output := t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1241_c7_f14c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1241_c7_f14c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1245_c7_1232] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1245_c7_1232_cond <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_cond;
     n16_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue;
     n16_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_return_output := n16_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1241_c7_f14c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1241_c7_f14c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue := VAR_MUX_uxn_opcodes_h_l1254_c21_7c12_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1236_c7_9f7a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1236_c7_9f7a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1236_c7_9f7a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1249_c7_e9ff] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output := result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;

     -- n16_MUX[uxn_opcodes_h_l1241_c7_f14c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_cond;
     n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue;
     n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output := n16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1236_c7_9f7a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;

     -- t16_MUX[uxn_opcodes_h_l1233_c7_a77d] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond;
     t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue;
     t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output := t16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1249_c7_e9ff_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1233_c7_a77d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1233_c7_a77d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1236_c7_9f7a] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond;
     n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue;
     n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output := n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1233_c7_a77d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;

     -- t16_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := t16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1245_c7_1232] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_return_output := result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1233_c7_a77d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1245_c7_1232_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;
     -- n16_MUX[uxn_opcodes_h_l1233_c7_a77d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_cond;
     n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue;
     n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output := n16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1241_c7_f14c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1241_c7_f14c_return_output;
     -- n16_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := n16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1236_c7_9f7a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1236_c7_9f7a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1233_c7_a77d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1233_c7_a77d_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1220_c2_ba83] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output := result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1258_l1216_DUPLICATE_2114 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1258_l1216_DUPLICATE_2114_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_84a2(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1220_c2_ba83_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1258_l1216_DUPLICATE_2114_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_84a2_uxn_opcodes_h_l1258_l1216_DUPLICATE_2114_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
