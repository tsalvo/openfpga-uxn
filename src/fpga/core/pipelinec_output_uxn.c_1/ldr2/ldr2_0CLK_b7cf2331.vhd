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
-- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_6f33]
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1638_c2_e27c]
signal t8_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_9dc5]
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1651_c7_30d4]
signal t8_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1652_c30_5cca]
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_d861]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_b309]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_b309]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_b309]
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_b309]
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_b309]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_b309]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_b309]
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_b309]
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c7_b309]
signal t8_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_9916]
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_f6c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_b63a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_b63a]
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_b63a]
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_b63a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_b63a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_b63a]
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_b63a]
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_81e0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_return_output : signed(17 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_aece]
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_7d05]
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_a970]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_a970]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_a970]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_a970]
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_a970]
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_a970]
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_eb44]
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_5603]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_5603]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_5603]
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_5603]
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(7 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_500b( ref_toks_0 : opcode_result_t;
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
      base.is_pc_updated := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.u16_value := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_stack_write := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_stack_index_flipped := ref_toks_9;
      base.is_opc_done := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_left,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_right,
BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- t8_MUX_uxn_opcodes_h_l1638_c2_e27c
t8_MUX_uxn_opcodes_h_l1638_c2_e27c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1638_c2_e27c_cond,
t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue,
t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse,
t8_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_left,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_right,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- t8_MUX_uxn_opcodes_h_l1651_c7_30d4
t8_MUX_uxn_opcodes_h_l1651_c7_30d4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1651_c7_30d4_cond,
t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue,
t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse,
t8_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca
sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_ins,
sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_x,
sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_y,
sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c7_b309
t8_MUX_uxn_opcodes_h_l1654_c7_b309 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c7_b309_cond,
t8_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c7_b309_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_left,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_right,
BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_cond,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_cond,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_left,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_right,
BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_left,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_right,
BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_cond,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_cond,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_cond,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_left,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_right,
BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_cond,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_cond,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 t8_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 t8_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output,
 sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c7_b309_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_03da : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_2f6d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_6a21 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_b309_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1657_c3_9877 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_f116_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1660_c3_e660 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_8df4_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_return_output : signed(18 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_52f9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_424c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_b60a_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_49a2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_59c7_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1675_l1634_DUPLICATE_75c5_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_52f9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1665_c3_52f9;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_2f6d := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_2f6d;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_424c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1670_c3_424c;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_right := to_unsigned(0, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_right := to_unsigned(5, 3);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_6a21 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1656_c3_6a21;
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_03da := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1643_c3_03da;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_ins := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse := tmp8_low;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1659_c11_f6c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output := result.is_ram_write;

     -- result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_b309_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1660_c27_8df4] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_8df4_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output := result.is_vram_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1657_c27_f116] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_f116_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1638_c6_6f33] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_left;
     BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output := BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_49a2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_49a2_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_b60a LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_b60a_return_output := result.u16_value;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_59c7 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_59c7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1668_c11_eb44] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_left;
     BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output := BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_9dc5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1652_c30_5cca] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_ins;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_x;
     sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_return_output := sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1662_c11_7d05] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_left;
     BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output := BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_d861] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1638_c6_6f33_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_9dc5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_d861_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1659_c11_f6c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1662_c11_7d05_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1668_c11_eb44_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1657_c27_f116_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1660_c27_8df4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_b60a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_b60a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1638_l1659_l1651_DUPLICATE_b60a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1668_l1662_l1659_l1654_l1651_DUPLICATE_62bc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_49a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_49a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_49a2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1659_l1651_l1662_l1654_DUPLICATE_49a2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_59c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_59c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_59c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1668_l1659_l1651_l1654_DUPLICATE_59c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1638_l1668_l1659_l1654_l1651_DUPLICATE_3311_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1638_c2_e27c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_result_sp_relative_shift_FALSE_INPUT_MUX_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1652_c30_5cca_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1668_c7_5603] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1657_c22_9916] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_return_output;

     -- t8_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     t8_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := t8_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1662_c7_a970] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1662_c7_a970] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_return_output := tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1668_c7_5603] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_return_output := result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1668_c7_5603] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_return_output := tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_81e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1668_c7_5603] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;

     -- Submodule level 2
     VAR_result_u16_value_uxn_opcodes_h_l1657_c3_9877 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1657_c22_9916_return_output)),16);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_left := VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_81e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1668_c7_5603_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1657_c3_9877;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1662_c7_a970] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1659_c7_b63a] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output := tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := t8_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1659_c7_b63a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1662_c7_a970] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_return_output := tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1660_c22_aece] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1662_c7_a970] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1662_c7_a970] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_return_output := result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1660_c3_e660 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1660_c22_aece_return_output)),16);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1662_c7_a970_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1660_c3_e660;
     -- tmp8_low_MUX[uxn_opcodes_h_l1659_c7_b63a] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output := tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1659_c7_b63a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output := result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := t8_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1659_c7_b63a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1659_c7_b63a] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output := result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1659_c7_b63a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1659_c7_b63a_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_b309] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output := result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1654_c7_b309_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_30d4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1651_c7_30d4_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1638_c2_e27c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1675_l1634_DUPLICATE_75c5 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1675_l1634_DUPLICATE_75c5_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_500b(
     result,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1638_c2_e27c_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1675_l1634_DUPLICATE_75c5_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_500b_uxn_opcodes_h_l1675_l1634_DUPLICATE_75c5_return_output;
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
