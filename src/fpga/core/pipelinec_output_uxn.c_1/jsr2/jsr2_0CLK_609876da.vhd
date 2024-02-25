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
-- Submodules: 57
entity jsr2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end jsr2_0CLK_609876da;
architecture arch of jsr2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l773_c6_c7eb]
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal t16_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_f8d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l786_c11_4e18]
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l786_c7_4a53]
signal t16_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_4a53]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l789_c11_6b83]
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal t16_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_5a9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l791_c3_b6fa]
signal CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l792_c30_9257]
signal sp_relative_shift_uxn_opcodes_h_l792_c30_9257_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_9257_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_9257_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l792_c30_9257_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l794_c11_66da]
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l794_c7_8631]
signal t16_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(15 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_8631]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l795_c3_3aec]
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l802_c11_4403]
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_9d31]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_9d31]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l802_c7_9d31]
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l802_c7_9d31]
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_9d31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_9d31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l805_c31_8df4]
signal CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_1899( ref_toks_0 : opcode_result_t;
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
      base.is_stack_index_flipped := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.is_ram_write := ref_toks_9;
      base.stack_address_sp_offset := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb
BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_left,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_right,
BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output);

-- t16_MUX_uxn_opcodes_h_l773_c2_f8d3
t16_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
t16_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3
result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3
result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18
BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_left,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_right,
BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output);

-- t16_MUX_uxn_opcodes_h_l786_c7_4a53
t16_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
t16_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
t16_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
t16_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53
result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53
result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83
BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_left,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_right,
BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output);

-- t16_MUX_uxn_opcodes_h_l789_c7_5a9b
t16_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
t16_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b
result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b
result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output);

-- CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa
CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_x,
CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_return_output);

-- sp_relative_shift_uxn_opcodes_h_l792_c30_9257
sp_relative_shift_uxn_opcodes_h_l792_c30_9257 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l792_c30_9257_ins,
sp_relative_shift_uxn_opcodes_h_l792_c30_9257_x,
sp_relative_shift_uxn_opcodes_h_l792_c30_9257_y,
sp_relative_shift_uxn_opcodes_h_l792_c30_9257_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da
BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_left,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_right,
BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output);

-- t16_MUX_uxn_opcodes_h_l794_c7_8631
t16_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l794_c7_8631_cond,
t16_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
t16_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
t16_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631
result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631
result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec
BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_left,
BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_right,
BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403
BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_left,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_right,
BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_return_output);

-- CONST_SR_8_uxn_opcodes_h_l805_c31_8df4
CONST_SR_8_uxn_opcodes_h_l805_c31_8df4 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_x,
CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output,
 t16_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output,
 t16_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output,
 t16_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output,
 CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_return_output,
 sp_relative_shift_uxn_opcodes_h_l792_c30_9257_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output,
 t16_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_return_output,
 BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_return_output,
 CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_b609 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_0ee4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_a722 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_f854 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_b0ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_4cdb_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_71f2 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_63d2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_8e95_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l773_l786_l802_l789_DUPLICATE_ff1e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_8645_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_44e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_cb12_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_e5e4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_2a69_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_4bbd_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_a71b_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l811_l769_DUPLICATE_be66_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_b609 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l778_c3_b609;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_b0ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l799_c3_b0ad;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_a722 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l787_c3_a722;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_63d2 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l804_c3_63d2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_0ee4 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l783_c3_0ee4;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_71f2 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l803_c3_71f2;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_f854 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l797_c3_f854;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_right := to_unsigned(3, 2);

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := t16;
     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_f8d3_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_a71b LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_a71b_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_4bbd LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_4bbd_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_e5e4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_e5e4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l773_c6_c7eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l786_c11_4e18] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_left;
     BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output := BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l773_l786_l802_l789_DUPLICATE_ff1e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l773_l786_l802_l789_DUPLICATE_ff1e_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l789_c11_6b83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_left;
     BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output := BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l792_c30_9257] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l792_c30_9257_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_ins;
     sp_relative_shift_uxn_opcodes_h_l792_c30_9257_x <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_x;
     sp_relative_shift_uxn_opcodes_h_l792_c30_9257_y <= VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_return_output := sp_relative_shift_uxn_opcodes_h_l792_c30_9257_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_8645 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_8645_return_output := result.is_stack_index_flipped;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_f8d3_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_2a69 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_2a69_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_44e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_44e9_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_cb12 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_cb12_return_output := result.is_stack_write;

     -- CONST_SR_8[uxn_opcodes_h_l805_c31_8df4] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_x <= VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_return_output := CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l794_c11_66da] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_left;
     BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output := BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l802_c11_4403] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_left;
     BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output := BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l800_c21_4cdb] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_4cdb_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l773_c6_c7eb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l786_c11_4e18_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l789_c11_6b83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l794_c11_66da_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l802_c11_4403_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_4bbd_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l790_l795_DUPLICATE_4bbd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l800_c21_4cdb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_2a69_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l786_l802_DUPLICATE_2a69_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l786_l773_l802_l794_l789_DUPLICATE_fb60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_e5e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_e5e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_e5e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_e5e4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_44e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_44e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_44e9_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l794_l786_l802_l789_DUPLICATE_44e9_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_8645_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_8645_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_8645_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_cb12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_cb12_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l794_l786_l789_DUPLICATE_cb12_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_a71b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l802_l789_DUPLICATE_a71b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l773_l786_l802_l789_DUPLICATE_ff1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l773_l786_l802_l789_DUPLICATE_ff1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l773_l786_l802_l789_DUPLICATE_ff1e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l773_l786_l802_l789_DUPLICATE_ff1e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l773_c2_f8d3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l773_c2_f8d3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l792_c30_9257_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l802_c7_9d31] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l802_c7_9d31] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l805_c21_8e95] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_8e95_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l805_c31_8df4_return_output);

     -- BIN_OP_OR[uxn_opcodes_h_l795_c3_3aec] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_left;
     BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_return_output := BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l791_c3_b6fa] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_x <= VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_return_output := CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l802_c7_9d31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l802_c7_9d31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l802_c7_9d31] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output := result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l795_c3_3aec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l805_c21_8e95_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l791_c3_b6fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l802_c7_9d31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output := result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- t16_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     t16_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     t16_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_return_output := t16_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l802_c7_9d31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- t16_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := t16_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l794_c7_8631] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_cond;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output := result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l794_c7_8631_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_t16_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     t16_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     t16_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := t16_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l789_c7_5a9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l789_c7_5a9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l786_c7_4a53] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_cond;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output := result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- t16_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := t16_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l786_c7_4a53_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l773_c2_f8d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l811_l769_DUPLICATE_be66 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l811_l769_DUPLICATE_be66_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1899(
     result,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l773_c2_f8d3_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l811_l769_DUPLICATE_be66_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1899_uxn_opcodes_h_l811_l769_DUPLICATE_be66_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
