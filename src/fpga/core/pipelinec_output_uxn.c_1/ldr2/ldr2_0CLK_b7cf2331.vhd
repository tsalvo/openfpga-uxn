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
-- Submodules: 61
entity ldr2_0CLK_b7cf2331 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr2_0CLK_b7cf2331;
architecture arch of ldr2_0CLK_b7cf2331 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8_high : unsigned(7 downto 0);
signal REG_COMB_tmp8_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_e0e0]
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1639_c2_4b58]
signal t8_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_dc80]
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1652_c7_84c3]
signal t8_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1653_c30_9eb9]
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_c6f4]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1655_c7_f1bd]
signal t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_34eb]
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_f090]
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_cb31]
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_cb31]
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_cb31]
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_cb31]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_cb31]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_cb31]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_cb31]
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_67d9]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_7d59]
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_1182]
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_924c]
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_924c]
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_924c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_924c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_924c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_924c]
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_b37e]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_f121]
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_f121]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_f121]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_f121]
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
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
-- BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_left,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_right,
BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- t8_MUX_uxn_opcodes_h_l1639_c2_4b58
t8_MUX_uxn_opcodes_h_l1639_c2_4b58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1639_c2_4b58_cond,
t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue,
t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse,
t8_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_left,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_right,
BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- t8_MUX_uxn_opcodes_h_l1652_c7_84c3
t8_MUX_uxn_opcodes_h_l1652_c7_84c3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1652_c7_84c3_cond,
t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue,
t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse,
t8_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9
sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_ins,
sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_x,
sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_y,
sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- t8_MUX_uxn_opcodes_h_l1655_c7_f1bd
t8_MUX_uxn_opcodes_h_l1655_c7_f1bd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond,
t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue,
t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse,
t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_left,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_right,
BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_left,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_right,
BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_cond,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_cond,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_left,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_right,
BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_left,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_right,
BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_cond,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_cond,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 t8_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 t8_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_e0e2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_0606 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_b185 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_54b3 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_f1bd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_6bb7_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1661_c3_1a9e : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_510c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_13ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_d12c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_254e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_3bc4_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_9d5e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1676_l1635_DUPLICATE_152a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8_high : unsigned(7 downto 0);
variable REG_VAR_tmp8_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8_high := tmp8_high;
  REG_VAR_tmp8_low := tmp8_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_54b3 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1657_c3_54b3;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_0606 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1644_c3_0606;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_d12c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1671_c3_d12c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_e0e2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1649_c3_e0e2;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_13ad := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1666_c3_13ad;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_9d5e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_9d5e_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output := result.is_pc_updated;

     -- sp_relative_shift[uxn_opcodes_h_l1653_c30_9eb9] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_ins;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_x;
     sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_return_output := sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1658_c27_6bb7] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_6bb7_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_254e LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_254e_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1660_c11_f090] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_left;
     BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output := BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1639_c6_e0e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_3bc4 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_3bc4_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1652_c11_dc80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_left;
     BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output := BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1663_c11_1182] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_left;
     BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output := BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c11_c6f4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1661_c27_510c] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_510c_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_f1bd_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_b37e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1639_c6_e0e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1652_c11_dc80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c11_c6f4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1660_c11_f090_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1663_c11_1182_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_b37e_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1658_c27_6bb7_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1661_c27_510c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_254e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_254e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1660_l1652_l1639_DUPLICATE_254e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1663_l1660_l1655_l1652_l1669_DUPLICATE_c1e5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_9d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_9d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_9d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1660_l1652_l1663_l1655_DUPLICATE_9d5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_3bc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_3bc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_3bc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1660_l1652_l1655_l1669_DUPLICATE_3bc4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1660_l1655_l1652_l1639_l1669_DUPLICATE_0b00_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1639_c2_4b58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1653_c30_9eb9_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1663_c7_924c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1658_c22_34eb] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_f121] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_return_output := result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;

     -- t8_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1669_c7_f121] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_return_output := tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_67d9] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1663_c7_924c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_f121] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1669_c7_f121] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_b185 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1658_c22_34eb_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_67d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1669_c7_f121_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_b185;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1660_c7_cb31] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1663_c7_924c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1663_c7_924c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1663_c7_924c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;

     -- t8_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := t8_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1660_c7_cb31] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output := tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1663_c7_924c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1661_c22_7d59] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1661_c3_1a9e := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1661_c22_7d59_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1663_c7_924c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1661_c3_1a9e;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1660_c7_cb31] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1660_c7_cb31] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output := tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1660_c7_cb31] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output := result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;

     -- t8_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := t8_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1660_c7_cb31] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1660_c7_cb31] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output := result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1660_c7_cb31_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c7_f1bd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c7_f1bd_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1652_c7_84c3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1652_c7_84c3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1639_c2_4b58] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output := tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1676_l1635_DUPLICATE_152a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1676_l1635_DUPLICATE_152a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_a906(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1639_c2_4b58_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1676_l1635_DUPLICATE_152a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_a906_uxn_opcodes_h_l1676_l1635_DUPLICATE_152a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8_high <= REG_VAR_tmp8_high;
REG_COMB_tmp8_low <= REG_VAR_tmp8_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8_high <= REG_COMB_tmp8_high;
     tmp8_low <= REG_COMB_tmp8_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
