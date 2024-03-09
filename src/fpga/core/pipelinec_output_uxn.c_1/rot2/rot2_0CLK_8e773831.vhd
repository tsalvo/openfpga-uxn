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
-- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_a7a1]
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2686_c2_d23f]
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_1488]
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2699_c7_6a3f]
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_5a7e]
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);

-- t16_high_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
signal t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2702_c7_48a8]
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_f895]
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output : unsigned(0 downto 0);

-- t16_low_MUX[uxn_opcodes_h_l2706_c7_8909]
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
signal t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_8909]
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_8909]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_8909]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_8909]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_8909]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2706_c7_8909]
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2706_c7_8909]
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2706_c7_8909]
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2706_c7_8909]
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_46a6]
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);

-- n16_high_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
signal n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2710_c7_83d2]
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_f5c5]
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_189c]
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_189c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_189c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_189c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_189c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : signed(3 downto 0);

-- n16_low_MUX[uxn_opcodes_h_l2714_c7_189c]
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
signal n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2714_c7_189c]
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2714_c7_189c]
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_6758]
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_a864]
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_a864]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_a864]
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_a864]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_a864]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : signed(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2718_c7_a864]
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(7 downto 0);

-- l16_high_MUX[uxn_opcodes_h_l2718_c7_a864]
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(7 downto 0);
signal l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l2720_c30_bcd4]
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_c337]
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_1eba]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_1eba]
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_1eba]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_1eba]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : signed(3 downto 0);

-- l16_low_MUX[uxn_opcodes_h_l2725_c7_1eba]
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(7 downto 0);
signal l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_eafa]
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_7f13]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_7f13]
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_7f13]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_8570]
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_8aea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_8aea]
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_8aea]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_2163]
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_d231]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_d231]
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_d231]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_c816]
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_f66f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_f66f]
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_f66f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output : unsigned(3 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_375c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_vram_write := ref_toks_1;
      base.is_pc_updated := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.u8_value := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_stack_index_flipped := ref_toks_8;
      base.sp_relative_shift := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_left,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_right,
BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f
t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f
n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f
t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f
l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f
n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f
l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond,
l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue,
l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse,
l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_left,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_right,
BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f
t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f
n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f
t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f
l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f
n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f
l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond,
l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue,
l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse,
l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_left,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_right,
BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8
t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8
n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8
t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8
l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8
n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8
l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond,
l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue,
l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse,
l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_left,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_right,
BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output);

-- t16_low_MUX_uxn_opcodes_h_l2706_c7_8909
t16_low_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2706_c7_8909
n16_low_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2706_c7_8909
l16_low_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2706_c7_8909
n16_high_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2706_c7_8909
l16_high_MUX_uxn_opcodes_h_l2706_c7_8909 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond,
l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue,
l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse,
l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_left,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_right,
BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2
n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2
l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2
n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2
l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond,
l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue,
l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse,
l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_left,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_right,
BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- n16_low_MUX_uxn_opcodes_h_l2714_c7_189c
n16_low_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2714_c7_189c
l16_low_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2714_c7_189c
l16_high_MUX_uxn_opcodes_h_l2714_c7_189c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_cond,
l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue,
l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse,
l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_left,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_right,
BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_cond,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2718_c7_a864
l16_low_MUX_uxn_opcodes_h_l2718_c7_a864 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_cond,
l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue,
l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse,
l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_return_output);

-- l16_high_MUX_uxn_opcodes_h_l2718_c7_a864
l16_high_MUX_uxn_opcodes_h_l2718_c7_a864 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_cond,
l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue,
l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse,
l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_return_output);

-- sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4
sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_ins,
sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_x,
sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_y,
sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_left,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_right,
BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_cond,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output);

-- l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba
l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_cond,
l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue,
l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse,
l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_left,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_right,
BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_cond,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_left,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_right,
BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_cond,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_left,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_right,
BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_cond,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_left,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_right,
BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_cond,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output,
 t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output,
 t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output,
 t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output,
 t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_return_output,
 l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_return_output,
 l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_return_output,
 sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output,
 l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_d0d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_1afd : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_60a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_f25a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
 variable VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output : unsigned(0 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
 variable VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_9ee2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_799f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
 variable VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_7590 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
 variable VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_return_output : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_cd74 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse : unsigned(7 downto 0);
 variable VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_a6a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_a670 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse : unsigned(7 downto 0);
 variable VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_1695 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_a0d5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_a42d : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_a1ab : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_f66f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2682_l2749_DUPLICATE_8942_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_y := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_right := to_unsigned(9, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_a6a8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2728_c3_a6a8;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_d0d8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2696_c3_d0d8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_9ee2 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2708_c3_9ee2;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_f25a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2704_c3_f25a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_1695 := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2732_c3_1695;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_7590 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2716_c3_7590;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_60a4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2700_c3_60a4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_a42d := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2740_c3_a42d;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_a1ab := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2744_c3_a1ab;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_1afd := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2691_c3_1afd;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_a0d5 := resize(to_unsigned(5, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2736_c3_a0d5;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_799f := resize(to_unsigned(6, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2712_c3_799f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_a670 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l2727_c3_a670;
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_x := signed(std_logic_vector(resize(to_unsigned(6, 3), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_cd74 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l2722_c3_cd74;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_right := to_unsigned(5, 3);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_ins := VAR_ins;
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := l16_high;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse := l16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue := l16_high;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue := l16_low;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse := l16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue := l16_low;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := n16_high;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := n16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue := n16_high;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := n16_low;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := n16_low;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue := n16_low;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_left := VAR_phase;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue := VAR_previous_stack_read;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue := VAR_previous_stack_read;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := VAR_previous_stack_read;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := VAR_previous_stack_read;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := VAR_previous_stack_read;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := t16_high;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := t16_high;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := t16_low;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := t16_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l2725_c11_c337] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_left;
     BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output := BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2702_c11_5a7e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_left;
     BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output := BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2706_c11_f895] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_left;
     BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output := BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l2720_c30_bcd4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_ins;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_x;
     sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_return_output := sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2686_c6_a7a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l2743_c7_f66f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_f66f_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2699_c11_1488] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_left;
     BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output := BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2731_c11_eafa] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_left;
     BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output := BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2735_c11_8570] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_left;
     BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output := BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2718_c11_6758] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_left;
     BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output := BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output := result.is_pc_updated;

     -- BIN_OP_EQ[uxn_opcodes_h_l2743_c11_c816] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_left;
     BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output := BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l2714_c11_f5c5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_left;
     BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output := BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l2710_c11_46a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l2739_c11_2163] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_left;
     BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output := BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output;

     -- Submodule level 1
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2686_c6_a7a1_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2699_c11_1488_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2702_c11_5a7e_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2706_c11_f895_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2710_c11_46a6_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2714_c11_f5c5_return_output;
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2718_c11_6758_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2725_c11_c337_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2731_c11_eafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2735_c11_8570_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2739_c11_2163_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l2743_c11_c816_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2725_l2714_l2710_DUPLICATE_4fe7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l2706_l2735_l2702_l2731_l2699_l2725_l2718_l2714_l2743_l2710_l2739_DUPLICATE_dfad_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2718_l2714_l2710_DUPLICATE_0dfe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l2706_l2702_l2699_l2686_l2714_l2743_l2710_DUPLICATE_98cc_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l2743_c7_f66f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l2720_c30_bcd4_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2743_c7_f66f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2743_c7_f66f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2718_c7_a864] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_cond;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_return_output := l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2725_c7_1eba] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2725_c7_1eba] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_cond;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output := l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2718_c7_a864] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2743_c7_f66f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- Submodule level 2
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2743_c7_f66f_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     -- t16_high_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2739_c7_d231] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_return_output := result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2718_c7_a864] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2739_c7_d231] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2718_c7_a864] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_cond;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_return_output := l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2739_c7_d231] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_return_output;

     -- Submodule level 3
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2739_c7_d231_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2739_c7_d231_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2739_c7_d231_return_output;
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_t16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2735_c7_8aea] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- t16_high_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2735_c7_8aea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output;

     -- t16_low_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2735_c7_8aea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output := result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- Submodule level 4
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2735_c7_8aea_return_output;
     REG_VAR_t16_high := VAR_t16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_t16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     -- t16_low_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2731_c7_7f13] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2731_c7_7f13] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output := result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2731_c7_7f13] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- Submodule level 5
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_n16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2731_c7_7f13_return_output;
     REG_VAR_t16_low := VAR_t16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2725_c7_1eba] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output := result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2725_c7_1eba] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- n16_high_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2725_c7_1eba] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;

     -- Submodule level 6
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     REG_VAR_n16_high := VAR_n16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_n16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2725_c7_1eba_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- l16_high_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2718_c7_a864] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_return_output := result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2718_c7_a864] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2718_c7_a864] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;

     -- n16_low_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- Submodule level 7
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_l16_high_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     REG_VAR_n16_low := VAR_n16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2718_c7_a864_return_output;
     -- l16_high_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2714_c7_189c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;

     -- Submodule level 8
     REG_VAR_l16_high := VAR_l16_high_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_l16_low_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2714_c7_189c_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- l16_low_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2710_c7_83d2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- Submodule level 9
     REG_VAR_l16_low := VAR_l16_low_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2710_c7_83d2_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2706_c7_8909] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;

     -- Submodule level 10
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2706_c7_8909_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2702_c7_48a8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;

     -- Submodule level 11
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2702_c7_48a8_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2699_c7_6a3f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l2699_c7_6a3f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l2686_c2_d23f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output := result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2682_l2749_DUPLICATE_8942 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2682_l2749_DUPLICATE_8942_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_375c(
     result,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l2686_c2_d23f_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2682_l2749_DUPLICATE_8942_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_375c_uxn_opcodes_h_l2682_l2749_DUPLICATE_8942_return_output;
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
