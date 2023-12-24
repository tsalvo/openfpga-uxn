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
-- BIN_OP_EQ[uxn_opcodes_h_l1655_c6_2a7d]
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1655_c2_b570]
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1655_c2_b570]
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1655_c2_b570]
signal t8_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1655_c2_b570]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_1b00]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal t8_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_c18f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1669_c30_ce9b]
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1671_c11_aa07]
signal BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal t8_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1671_c7_edd8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1674_c22_1833]
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_2d7b]
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1676_c7_0124]
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1676_c7_0124]
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1676_c7_0124]
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_0124]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_0124]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1676_c7_0124]
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_0124]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_33dd]
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_6d41]
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_5c13]
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1679_c7_31c7]
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1679_c7_31c7]
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_31c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_31c7]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_31c7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1679_c7_31c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_9732]
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_d2d3]
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_d2d3]
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_d2d3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_d2d3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_775a( ref_toks_0 : opcode_result_t;
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
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.u16_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_ram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_left,
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_right,
BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- t8_MUX_uxn_opcodes_h_l1655_c2_b570
t8_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
t8_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
t8_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
t8_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- t8_MUX_uxn_opcodes_h_l1668_c7_c18f
t8_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
t8_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b
sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_ins,
sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_x,
sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_y,
sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_left,
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_right,
BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- t8_MUX_uxn_opcodes_h_l1671_c7_edd8
t8_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
t8_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_left,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_right,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_left,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_right,
BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_cond,
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_cond,
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond,
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond,
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_left,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_right,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_left,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_right,
BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_left,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_right,
BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_cond,
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_cond,
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_left,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_right,
BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 t8_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 t8_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output,
 sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 t8_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1660_c3_14c4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_0e62 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1674_c3_b9af : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1673_c3_1491 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1671_c7_edd8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_df8c_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1677_c3_dad0 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1677_c27_bec4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_43f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1687_c3_c518 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_6a44_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_af37_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_c868_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1692_l1651_DUPLICATE_bb3c_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_43f9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1682_c3_43f9;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1660_c3_14c4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1660_c3_14c4;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1673_c3_1491 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1673_c3_1491;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_0e62 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_0e62;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1687_c3_c518 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1687_c3_c518;
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue := to_unsigned(1, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_right := to_unsigned(4, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_1b00] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1685_c11_9732] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_left;
     BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output := BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1655_c2_b570_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1655_c6_2a7d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1677_c27_bec4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1677_c27_bec4_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_c868 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_c868_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1655_c2_b570_return_output := result.is_pc_updated;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1655_c2_b570_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_af37 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_af37_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1655_c2_b570_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1676_c11_2d7b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1671_c11_aa07] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_left;
     BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output := BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_6a44 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_6a44_return_output := result.u16_value;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1671_c7_edd8_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505_return_output := result.is_opc_done;

     -- sp_relative_shift[uxn_opcodes_h_l1669_c30_ce9b] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_ins;
     sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_x;
     sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_return_output := sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4_return_output := result.u8_value;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1674_c27_df8c] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_df8c_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1679_c11_5c13] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_left;
     BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output := BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1655_c6_2a7d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_1b00_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1671_c11_aa07_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1676_c11_2d7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1679_c11_5c13_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1685_c11_9732_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1674_c27_df8c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1677_c27_bec4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_6a44_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_6a44_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1655_l1676_l1668_DUPLICATE_6a44_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1685_l1679_l1676_l1671_DUPLICATE_6505_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_c868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_c868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_c868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1676_l1668_l1679_l1671_DUPLICATE_c868_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_af37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_af37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_af37_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1685_l1676_l1668_l1671_DUPLICATE_af37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1668_l1655_l1685_l1676_l1671_DUPLICATE_61c4_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1655_c2_b570_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1655_c2_b570_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1655_c2_b570_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1655_c2_b570_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1669_c30_ce9b_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := t8_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1685_c7_d2d3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1685_c7_d2d3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1685_c7_d2d3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1685_c7_d2d3] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output := tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1679_c7_31c7] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output := tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1674_c22_1833] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_33dd] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1679_c7_31c7] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1674_c3_b9af := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c22_1833_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_33dd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1685_c7_d2d3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1674_c3_b9af;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1676_c7_0124] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1677_c22_6d41] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1679_c7_31c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1679_c7_31c7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;

     -- t8_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := t8_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1676_c7_0124] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_return_output := tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1679_c7_31c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1679_c7_31c7] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output := tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1677_c3_dad0 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1677_c22_6d41_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1679_c7_31c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1677_c3_dad0;
     -- tmp8_high_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1676_c7_0124] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output := result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1676_c7_0124] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_return_output := tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;

     -- t8_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     t8_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     t8_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := t8_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1676_c7_0124] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1676_c7_0124] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output := result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1676_c7_0124] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1676_c7_0124_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1671_c7_edd8] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output := tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1671_c7_edd8_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_c18f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_c18f_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1655_c2_b570] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output := result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1655_c2_b570_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1692_l1651_DUPLICATE_bb3c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1692_l1651_DUPLICATE_bb3c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1655_c2_b570_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1655_c2_b570_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1692_l1651_DUPLICATE_bb3c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1692_l1651_DUPLICATE_bb3c_return_output;
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
