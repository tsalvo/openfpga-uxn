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
-- Submodules: 102
entity rot2_0CLK_8e773831 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end rot2_0CLK_8e773831;
architecture arch of rot2_0CLK_8e773831 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal t16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l16_high : unsigned(7 downto 0) := to_unsigned(0, 8);
signal l16_low : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16_high : unsigned(7 downto 0);
signal REG_COMB_t16_low : unsigned(7 downto 0);
signal REG_COMB_n16_high : unsigned(7 downto 0);
signal REG_COMB_n16_low : unsigned(7 downto 0);
signal REG_COMB_l16_high : unsigned(7 downto 0);
signal REG_COMB_l16_low : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l2702_c6_fe5e]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2702_c2_9051]
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2702_c2_9051]
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2702_c2_9051]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2702_c2_9051]
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2702_c2_9051]
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2702_c2_9051]
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2702_c2_9051]
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_b798]
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2715_c7_28cd]
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_6f03]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output : unsigned(0 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2718_c7_e442]
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2718_c7_e442]
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_e442]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_e442]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_e442]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_e442]
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_e442]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2718_c7_e442]
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2718_c7_e442]
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2718_c7_e442]
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2718_c7_e442]
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_4597]
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2722_c7_d4d6]
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_3dad]
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output : unsigned(0 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2726_c7_a9b0]
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_2df3]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(0 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2730_c7_7f60]
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_dfcb]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_6d93]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_6d93]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2734_c7_6d93]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_6d93]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_6d93]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(0 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2734_c7_6d93]
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2734_c7_6d93]
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2736_c30_b932]
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_0f80]
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2741_c7_678b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2741_c7_678b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2741_c7_678b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2741_c7_678b]
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2741_c7_678b]
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_9235]
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2747_c7_56d9]
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_56d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_56d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_29f8]
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2751_c7_1e66]
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_1e66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_1e66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_e80e]
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_41ce]
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_41ce]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_41ce]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_2110]
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2759_c7_93d8]
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2759_c7_93d8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2759_c7_93d8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_188e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.is_vram_write := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.stack_address_sp_offset := ref_toks_8;
      base.is_ram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2702_c2_9051
t16_high_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2702_c2_9051
n16_high_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2702_c2_9051
n16_low_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2702_c2_9051
t16_low_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2702_c2_9051
l16_high_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2702_c2_9051
l16_low_MUX_uxn_opcodes_h_l2702_c2_9051 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond,
l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue,
l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse,
l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_left,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_right,
BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd
t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd
n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd
n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd
t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd
l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd
l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond,
l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue,
l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse,
l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2718_c7_e442
t16_high_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2718_c7_e442
n16_high_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2718_c7_e442
n16_low_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2718_c7_e442
t16_low_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2718_c7_e442
l16_high_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2718_c7_e442
l16_low_MUX_uxn_opcodes_h_l2718_c7_e442 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond,
l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue,
l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse,
l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_left,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_right,
BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6
n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6
n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6
t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6
l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6
l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond,
l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue,
l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse,
l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_left,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_right,
BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0
n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0
n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0
l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0
l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond,
l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue,
l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse,
l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60
n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60
l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60
l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond,
l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue,
l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse,
l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93
l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_cond,
l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue,
l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse,
l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93
l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_cond,
l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue,
l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse,
l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2736_c30_b932
sp_relative_shift_uxn_opcodes_h_l2736_c30_b932 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_ins,
sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_x,
sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_y,
sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_left,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_right,
BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2741_c7_678b
l16_low_MUX_uxn_opcodes_h_l2741_c7_678b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_cond,
l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue,
l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse,
l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_left,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_right,
BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_left,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_right,
BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_cond,
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_left,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_right,
BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_cond,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_left,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_right,
BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t16_high,
 t16_low,
 n16_high,
 n16_low,
 l16_high,
 l16_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output,
 t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output,
 t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output,
 t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output,
 n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output,
 n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output,
 l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output,
 l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output,
 sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_return_output,
 l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2707_c3_9d61 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_8ed9 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_fdd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_664f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_93c3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e4ef : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_889c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_0f0f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2743_c3_a180 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_6631 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_88aa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_153c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_6628 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_5032 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2759_c7_93d8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2765_l2698_DUPLICATE_b665_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16_high : unsigned(7 downto 0);
variable REG_VAR_t16_low : unsigned(7 downto 0);
variable REG_VAR_n16_high : unsigned(7 downto 0);
variable REG_VAR_n16_low : unsigned(7 downto 0);
variable REG_VAR_l16_high : unsigned(7 downto 0);
variable REG_VAR_l16_low : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16_high := t16_high;
  REG_VAR_t16_low := t16_low;
  REG_VAR_n16_high := n16_high;
  REG_VAR_n16_low := n16_low;
  REG_VAR_l16_high := l16_high;
  REG_VAR_l16_low := l16_low;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_right := to_unsigned(10, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_6628 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2756_c3_6628;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_889c := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_889c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_0f0f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2738_c3_0f0f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_right := to_unsigned(11, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_5032 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2760_c3_5032;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_88aa := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2748_c3_88aa;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_8ed9 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_8ed9;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e4ef := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_e4ef;
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_right := to_unsigned(8, 4);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2743_c3_a180 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2743_c3_a180;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2707_c3_9d61 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2707_c3_9d61;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_664f := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2720_c3_664f;
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_fdd7 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_fdd7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_right := to_unsigned(9, 4);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_153c := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2752_c3_153c;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_93c3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2724_c3_93c3;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_6631 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_6631;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2759_c11_2110] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_left;
     BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output := BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_dfcb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l2715_c11_b798] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_left;
     BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output := BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2722_c11_4597] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_left;
     BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output := BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2759_c7_93d8] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2759_c7_93d8_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output := result.u8_value;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2702_c2_9051_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2747_c11_9235] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_left;
     BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output := BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2755_c11_e80e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c6_fe5e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2741_c11_0f80] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_left;
     BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output := BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_2df3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2702_c2_9051_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2751_c11_29f8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_6f03] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2736_c30_b932] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_ins;
     sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_x;
     sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_return_output := sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2726_c11_3dad] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_left;
     BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output := BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2702_c2_9051_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2702_c2_9051_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c6_fe5e_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2715_c11_b798_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6f03_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2722_c11_4597_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2726_c11_3dad_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_2df3_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_dfcb_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2741_c11_0f80_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2747_c11_9235_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2751_c11_29f8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2755_c11_e80e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2759_c11_2110_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2722_l2718_l2741_l2715_l2730_l2726_DUPLICATE_b0b2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2751_l2722_l2747_l2718_l2741_l2715_l2734_l2730_l2759_l2726_l2755_DUPLICATE_29fa_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2734_l2730_l2726_DUPLICATE_3746_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2722_l2718_l2715_l2702_l2730_l2759_l2726_DUPLICATE_04ea_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2759_c7_93d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2736_c30_b932_return_output;
     -- n16_high_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2741_c7_678b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2759_c7_93d8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2734_c7_6d93] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_cond;
     l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output := l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2759_c7_93d8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2741_c7_678b] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_cond;
     l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_return_output := l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2759_c7_93d8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2734_c7_6d93] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2759_c7_93d8_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2734_c7_6d93] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2755_c7_41ce] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2755_c7_41ce] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2734_c7_6d93] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_cond;
     l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output := l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2755_c7_41ce] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output := result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2755_c7_41ce_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2751_c7_1e66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output := result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2751_c7_1e66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2751_c7_1e66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2751_c7_1e66_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     -- n16_low_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2747_c7_56d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2747_c7_56d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2747_c7_56d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2747_c7_56d9_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2741_c7_678b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2741_c7_678b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2741_c7_678b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2741_c7_678b_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_6d93] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_6d93] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_6d93] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_6d93_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_7f60] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7f60_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2726_c7_a9b0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2726_c7_a9b0_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2722_c7_d4d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2722_c7_d4d6_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_e442] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_return_output := result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_e442_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2715_c7_28cd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2715_c7_28cd_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c2_9051] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2765_l2698_DUPLICATE_b665 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2765_l2698_DUPLICATE_b665_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_188e(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c2_9051_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2702_c2_9051_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2765_l2698_DUPLICATE_b665_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_188e_uxn_opcodes_h_l2765_l2698_DUPLICATE_b665_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16_high <= REG_VAR_t16_high;
REG_COMB_t16_low <= REG_VAR_t16_low;
REG_COMB_n16_high <= REG_VAR_n16_high;
REG_COMB_n16_low <= REG_VAR_n16_low;
REG_COMB_l16_high <= REG_VAR_l16_high;
REG_COMB_l16_low <= REG_VAR_l16_low;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16_high <= REG_COMB_t16_high;
     t16_low <= REG_COMB_t16_low;
     n16_high <= REG_COMB_n16_high;
     n16_low <= REG_COMB_n16_low;
     l16_high <= REG_COMB_l16_high;
     l16_low <= REG_COMB_l16_low;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
