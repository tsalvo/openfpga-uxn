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
-- BIN_OP_EQ[uxn_opcodes_h_l774_c6_ddf4]
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l774_c2_6593]
signal t16_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l774_c2_6593]
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l787_c11_dacd]
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l787_c7_a140]
signal t16_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l787_c7_a140]
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l790_c11_dd83]
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l790_c7_9443]
signal t16_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l790_c7_9443]
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l792_c3_c7ce]
signal CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l793_c30_29f6]
signal sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l795_c11_aa55]
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal t16_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l795_c7_a6b0]
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l796_c3_2509]
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l803_c11_758d]
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l803_c7_3ee4]
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_3ee4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_3ee4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_3ee4]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_3ee4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l803_c7_3ee4]
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l806_c31_5e29]
signal CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_a906( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.is_pc_updated := ref_toks_9;
      base.u8_value := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4
BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_left,
BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_right,
BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output);

-- t16_MUX_uxn_opcodes_h_l774_c2_6593
t16_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l774_c2_6593_cond,
t16_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
t16_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
t16_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593
result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593
result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_cond,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd
BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_left,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_right,
BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output);

-- t16_MUX_uxn_opcodes_h_l787_c7_a140
t16_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l787_c7_a140_cond,
t16_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
t16_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
t16_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140
result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140
result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_cond,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83
BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_left,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_right,
BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output);

-- t16_MUX_uxn_opcodes_h_l790_c7_9443
t16_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l790_c7_9443_cond,
t16_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
t16_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
t16_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443
result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443
result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_cond,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output);

-- CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce
CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_x,
CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_return_output);

-- sp_relative_shift_uxn_opcodes_h_l793_c30_29f6
sp_relative_shift_uxn_opcodes_h_l793_c30_29f6 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_ins,
sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_x,
sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_y,
sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55
BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_left,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_right,
BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output);

-- t16_MUX_uxn_opcodes_h_l795_c7_a6b0
t16_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
t16_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0
result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0
result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l796_c3_2509
BIN_OP_OR_uxn_opcodes_h_l796_c3_2509 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_left,
BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_right,
BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d
BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_left,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_right,
BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4
result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4
result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output);

-- CONST_SR_8_uxn_opcodes_h_l806_c31_5e29
CONST_SR_8_uxn_opcodes_h_l806_c31_5e29 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_x,
CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output,
 t16_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output,
 t16_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output,
 t16_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output,
 CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_return_output,
 sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output,
 t16_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output,
 CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_5e15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_0855 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_6292 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_x : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_46a9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_9e90 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_7433_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_665d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_6f51 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_9e07_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_3421_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_dd2b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_190a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4e7e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_f301_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_91dc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_974b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_4aab_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l812_l770_DUPLICATE_272d_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue := to_unsigned(1, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_6f51 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l805_c3_6f51;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_6292 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l788_c3_6292;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_0855 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l779_c3_0855;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_665d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l804_c3_665d;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_9e90 := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l798_c3_9e90;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_5e15 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l784_c3_5e15;
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_right := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_46a9 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l800_c3_46a9;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_right := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_ins := VAR_ins;
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_x := VAR_pc;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_left := t16;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := t16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4e7e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4e7e_return_output := result.is_stack_index_flipped;

     -- CONST_SR_8[uxn_opcodes_h_l806_c31_5e29] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_x <= VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_return_output := CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_f301 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_f301_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_4aab LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_4aab_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_dd2b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_dd2b_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l795_c11_aa55] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_left;
     BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output := BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l790_c11_dd83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_left;
     BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output := BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_6593_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_3421 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_3421_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l803_c11_758d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_left;
     BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output := BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_91dc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_91dc_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l793_c30_29f6] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_ins;
     sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_x <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_x;
     sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_y <= VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_return_output := sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_6593_return_output := result.is_ram_write;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l801_c21_7433] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_7433_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_pc);

     -- BIN_OP_EQ[uxn_opcodes_h_l774_c6_ddf4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_left;
     BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output := BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l787_c11_dacd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_left;
     BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output := BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_190a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_190a_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386_return_output := result.u16_value;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_974b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_974b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l774_c6_ddf4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l787_c11_dacd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l790_c11_dd83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l795_c11_aa55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l803_c11_758d_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_974b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l791_l796_DUPLICATE_974b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l801_c21_7433_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_f301_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l787_l803_DUPLICATE_f301_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l803_l795_l790_l787_l774_DUPLICATE_4386_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_dd2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_dd2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_dd2b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_dd2b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_91dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_91dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_91dc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l787_l803_l790_l795_DUPLICATE_91dc_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4e7e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4e7e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_4e7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_190a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_190a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l787_l790_l795_DUPLICATE_190a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_4aab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l803_l790_DUPLICATE_4aab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_3421_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_3421_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_3421_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l787_l803_l790_l774_DUPLICATE_3421_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l774_c2_6593_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l774_c2_6593_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l793_c30_29f6_return_output;
     -- CONST_SL_8[uxn_opcodes_h_l792_c3_c7ce] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_x <= VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_return_output := CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l803_c7_3ee4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output := result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l803_c7_3ee4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l796_c3_2509] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_left;
     BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_return_output := BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l803_c7_3ee4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l803_c7_3ee4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l803_c7_3ee4] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l806_c21_9e07] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_9e07_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l806_c31_5e29_return_output);

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l796_c3_2509_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l806_c21_9e07_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l792_c3_c7ce_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- t16_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := t16_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l803_c7_3ee4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output := result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l803_c7_3ee4_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_t16_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- t16_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     t16_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     t16_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_return_output := t16_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l795_c7_a6b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l795_c7_a6b0_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_t16_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l790_c7_9443] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_cond;
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output := result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- t16_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     t16_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     t16_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_return_output := t16_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l790_c7_9443_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_t16_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     -- t16_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     t16_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     t16_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_return_output := t16_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l787_c7_a140] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_cond;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output := result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- Submodule level 6
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l787_c7_a140_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l774_c2_6593_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l774_c2_6593] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_cond;
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output := result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l812_l770_DUPLICATE_272d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l812_l770_DUPLICATE_272d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l774_c2_6593_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l774_c2_6593_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l812_l770_DUPLICATE_272d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l812_l770_DUPLICATE_272d_return_output;
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
