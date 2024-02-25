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
-- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_1b96]
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_3e3d]
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_1193]
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2698_c7_9777]
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2698_c7_9777]
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2698_c7_9777]
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2698_c7_9777]
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2698_c7_9777]
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2698_c7_9777]
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_9777]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_9777]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_9777]
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_9777]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_9777]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_5797]
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2701_c7_867f]
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2701_c7_867f]
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2701_c7_867f]
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2701_c7_867f]
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2701_c7_867f]
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2701_c7_867f]
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_867f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_867f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_867f]
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_867f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_867f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_a5ab]
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_1c6b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_85e0]
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2709_c7_1239]
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2709_c7_1239]
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2709_c7_1239]
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2709_c7_1239]
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_1239]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_1239]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_1239]
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_1239]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_1239]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_05e8]
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_9a56]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_feea]
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2717_c7_6587]
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2717_c7_6587]
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_6587]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_6587]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_6587]
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_6587]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_6587]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2719_c30_34bf]
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_5bb8]
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output : unsigned(0 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2724_c7_670a]
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_670a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_670a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_670a]
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_670a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_83df]
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_7d5e]
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_7d5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_7d5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c800]
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_94b4]
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_94b4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_94b4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_4543]
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_0ed9]
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_0ed9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_0ed9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_7cf0]
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_bdb7]
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_bdb7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_bdb7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_8b52( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
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
      base.sp_relative_shift := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_stack_index_flipped := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_opc_done := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_vram_write := ref_toks_8;
      base.u8_value := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_left,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_right,
BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d
t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d
t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d
l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d
l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d
n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d
n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_left,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_right,
BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2698_c7_9777
t16_low_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2698_c7_9777
t16_high_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2698_c7_9777
l16_low_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2698_c7_9777
l16_high_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2698_c7_9777
n16_low_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2698_c7_9777
n16_high_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_left,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_right,
BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2701_c7_867f
t16_low_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2701_c7_867f
t16_high_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2701_c7_867f
l16_low_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2701_c7_867f
l16_high_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2701_c7_867f
n16_low_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2701_c7_867f
n16_high_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_left,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_right,
BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b
t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b
l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b
l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b
n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b
n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_left,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_right,
BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2709_c7_1239
l16_low_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2709_c7_1239
l16_high_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2709_c7_1239
n16_low_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2709_c7_1239
n16_high_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_left,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_right,
BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56
l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56
l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56
n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_left,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_right,
BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2717_c7_6587
l16_low_MUX_uxn_opcodes_h_l2717_c7_6587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_cond,
l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue,
l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse,
l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2717_c7_6587
l16_high_MUX_uxn_opcodes_h_l2717_c7_6587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_cond,
l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue,
l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse,
l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_cond,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf
sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_ins,
sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_x,
sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_y,
sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_left,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_right,
BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2724_c7_670a
l16_low_MUX_uxn_opcodes_h_l2724_c7_670a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_cond,
l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue,
l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse,
l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_cond,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_left,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_right,
BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_left,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_right,
BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_cond,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_left,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_right,
BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_left,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_right,
BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output,
 t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output,
 t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output,
 t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output,
 t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output,
 l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output,
 l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output,
 l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_return_output,
 l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_return_output,
 sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output,
 l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_b03c : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_0903 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_ed63 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_65f7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_8a02 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_38ca : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_b459 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_542a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_fb85 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_f9cf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_5a08 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_cc0c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_cd82 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_0890 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_bdb7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2748_l2681_DUPLICATE_3b7f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_right := to_unsigned(10, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_right := to_unsigned(8, 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_cc0c := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2735_c3_cc0c;
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_right := to_unsigned(6, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_b03c := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2690_c3_b03c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_right := to_unsigned(2, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_5a08 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2731_c3_5a08;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_right := to_unsigned(9, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_542a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2721_c3_542a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_cd82 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2739_c3_cd82;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_right := to_unsigned(11, 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_fb85 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2727_c3_fb85;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_65f7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2703_c3_65f7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_0890 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2743_c3_0890;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_38ca := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2711_c3_38ca;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_0903 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2695_c3_0903;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_8a02 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2707_c3_8a02;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_ed63 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2699_c3_ed63;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_b459 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2715_c3_b459;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_right := to_unsigned(7, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_f9cf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2726_c3_f9cf;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2738_c11_4543] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_left;
     BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output := BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2705_c11_a5ab] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_left;
     BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output := BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2734_c11_c800] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_left;
     BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output := BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2698_c11_1193] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_left;
     BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output := BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output := result.is_ram_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l2724_c11_5bb8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2730_c11_83df] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_left;
     BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output := BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2709_c11_85e0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2713_c11_05e8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_left;
     BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output := BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2719_c30_34bf] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_ins;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_x;
     sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_return_output := sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2701_c11_5797] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_left;
     BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output := BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2742_c7_bdb7] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_bdb7_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l2685_c6_1b96] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_left;
     BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output := BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output := result.is_vram_write;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2742_c11_7cf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_left;
     BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output := BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2717_c11_feea] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_left;
     BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output := BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2685_c6_1b96_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2698_c11_1193_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2701_c11_5797_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2705_c11_a5ab_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2709_c11_85e0_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2713_c11_05e8_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2717_c11_feea_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2724_c11_5bb8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2730_c11_83df_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2734_c11_c800_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2738_c11_4543_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2742_c11_7cf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2724_l2713_l2709_DUPLICATE_3b7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2738_l2705_l2734_l2701_l2730_l2698_l2724_l2717_l2713_l2742_l2709_DUPLICATE_85db_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2717_l2713_l2709_DUPLICATE_6954_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2705_l2701_l2698_l2685_l2713_l2742_l2709_DUPLICATE_9e69_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2742_c7_bdb7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2719_c30_34bf_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2742_c7_bdb7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2742_c7_bdb7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output := result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2724_c7_670a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2724_c7_670a] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_cond;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_return_output := l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2717_c7_6587] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_cond;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_return_output := l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2717_c7_6587] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2742_c7_bdb7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2742_c7_bdb7_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2738_c7_0ed9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2717_c7_6587] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2738_c7_0ed9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2738_c7_0ed9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output := result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2717_c7_6587] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_cond;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_return_output := l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2738_c7_0ed9_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2734_c7_94b4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2734_c7_94b4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output := result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2734_c7_94b4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2734_c7_94b4_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     -- l16_low_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2730_c7_7d5e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output := result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2730_c7_7d5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2730_c7_7d5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2730_c7_7d5e_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2724_c7_670a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2724_c7_670a] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_return_output := result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2724_c7_670a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2724_c7_670a_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2717_c7_6587] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2717_c7_6587] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2717_c7_6587] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_return_output := result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2717_c7_6587_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2713_c7_9a56] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2713_c7_9a56_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2709_c7_1239] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_return_output := result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2709_c7_1239_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2705_c7_1c6b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2705_c7_1c6b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2701_c7_867f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2701_c7_867f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2698_c7_9777] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2698_c7_9777_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2685_c2_3e3d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2748_l2681_DUPLICATE_3b7f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2748_l2681_DUPLICATE_3b7f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8b52(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2685_c2_3e3d_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2748_l2681_DUPLICATE_3b7f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8b52_uxn_opcodes_h_l2748_l2681_DUPLICATE_3b7f_return_output;
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
