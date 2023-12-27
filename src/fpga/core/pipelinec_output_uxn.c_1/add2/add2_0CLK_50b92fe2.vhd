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
-- Submodules: 71
entity add2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end add2_0CLK_50b92fe2;
architecture arch of add2_0CLK_50b92fe2 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l853_c6_897b]
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l853_c2_98c6]
signal tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_98c6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l853_c2_98c6]
signal t16_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l853_c2_98c6]
signal n16_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l866_c11_4476]
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l866_c7_2259]
signal tmp16_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_2259]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l866_c7_2259]
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_2259]
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_2259]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_2259]
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l866_c7_2259]
signal t16_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l866_c7_2259]
signal n16_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l869_c11_5d31]
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l869_c7_1506]
signal tmp16_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_1506]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l869_c7_1506]
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_1506]
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_1506]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_1506]
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l869_c7_1506]
signal t16_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l869_c7_1506]
signal n16_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l874_c11_814a]
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l874_c7_68c0]
signal tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_68c0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l874_c7_68c0]
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_68c0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_68c0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_68c0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l874_c7_68c0]
signal t16_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l874_c7_68c0]
signal n16_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l875_c3_4ce6]
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l878_c11_71bb]
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l878_c7_2bf5]
signal tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_2bf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l878_c7_2bf5]
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_2bf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_2bf5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_2bf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l878_c7_2bf5]
signal n16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l882_c11_a729]
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l882_c7_253b]
signal tmp16_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_253b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l882_c7_253b]
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_253b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_253b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_253b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l882_c7_253b]
signal n16_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l883_c3_2313]
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_87e0]
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_left : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_right : unsigned(15 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_return_output : unsigned(16 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l885_c30_2014]
signal sp_relative_shift_uxn_opcodes_h_l885_c30_2014_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_2014_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_2014_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l885_c30_2014_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l890_c11_7e8e]
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_9f9b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l890_c7_9f9b]
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_9f9b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_9f9b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l893_c31_70bb]
signal CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_b856( ref_toks_0 : opcode_result_t;
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
      base.stack_address_sp_offset := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.is_ram_write := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_opc_done := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b
BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_left,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_right,
BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output);

-- tmp16_MUX_uxn_opcodes_h_l853_c2_98c6
tmp16_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6
result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- t16_MUX_uxn_opcodes_h_l853_c2_98c6
t16_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
t16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
t16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
t16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- n16_MUX_uxn_opcodes_h_l853_c2_98c6
n16_MUX_uxn_opcodes_h_l853_c2_98c6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l853_c2_98c6_cond,
n16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue,
n16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse,
n16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_left,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_right,
BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output);

-- tmp16_MUX_uxn_opcodes_h_l866_c7_2259
tmp16_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l866_c7_2259_cond,
tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
tmp16_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259
result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_cond,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- t16_MUX_uxn_opcodes_h_l866_c7_2259
t16_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l866_c7_2259_cond,
t16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
t16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
t16_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- n16_MUX_uxn_opcodes_h_l866_c7_2259
n16_MUX_uxn_opcodes_h_l866_c7_2259 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l866_c7_2259_cond,
n16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue,
n16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse,
n16_MUX_uxn_opcodes_h_l866_c7_2259_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31
BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_left,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_right,
BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output);

-- tmp16_MUX_uxn_opcodes_h_l869_c7_1506
tmp16_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l869_c7_1506_cond,
tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
tmp16_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506
result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_cond,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- t16_MUX_uxn_opcodes_h_l869_c7_1506
t16_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l869_c7_1506_cond,
t16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
t16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
t16_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- n16_MUX_uxn_opcodes_h_l869_c7_1506
n16_MUX_uxn_opcodes_h_l869_c7_1506 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l869_c7_1506_cond,
n16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue,
n16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse,
n16_MUX_uxn_opcodes_h_l869_c7_1506_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a
BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_left,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_right,
BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l874_c7_68c0
tmp16_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0
result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- t16_MUX_uxn_opcodes_h_l874_c7_68c0
t16_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
t16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
t16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
t16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- n16_MUX_uxn_opcodes_h_l874_c7_68c0
n16_MUX_uxn_opcodes_h_l874_c7_68c0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l874_c7_68c0_cond,
n16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue,
n16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse,
n16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6
BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_left,
BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_right,
BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb
BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_left,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_right,
BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output);

-- tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5
tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond,
tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue,
tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse,
tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5
result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_cond,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output);

-- n16_MUX_uxn_opcodes_h_l878_c7_2bf5
n16_MUX_uxn_opcodes_h_l878_c7_2bf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond,
n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue,
n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse,
n16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729
BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_left,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_right,
BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output);

-- tmp16_MUX_uxn_opcodes_h_l882_c7_253b
tmp16_MUX_uxn_opcodes_h_l882_c7_253b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l882_c7_253b_cond,
tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue,
tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse,
tmp16_MUX_uxn_opcodes_h_l882_c7_253b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b
result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_cond,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_return_output);

-- n16_MUX_uxn_opcodes_h_l882_c7_253b
n16_MUX_uxn_opcodes_h_l882_c7_253b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l882_c7_253b_cond,
n16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue,
n16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse,
n16_MUX_uxn_opcodes_h_l882_c7_253b_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l883_c3_2313
BIN_OP_OR_uxn_opcodes_h_l883_c3_2313 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_left,
BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_right,
BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0 : entity work.BIN_OP_PLUS_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_left,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_right,
BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_return_output);

-- sp_relative_shift_uxn_opcodes_h_l885_c30_2014
sp_relative_shift_uxn_opcodes_h_l885_c30_2014 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l885_c30_2014_ins,
sp_relative_shift_uxn_opcodes_h_l885_c30_2014_x,
sp_relative_shift_uxn_opcodes_h_l885_c30_2014_y,
sp_relative_shift_uxn_opcodes_h_l885_c30_2014_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e
BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_left,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_right,
BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b
result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_cond,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output);

-- CONST_SR_8_uxn_opcodes_h_l893_c31_70bb
CONST_SR_8_uxn_opcodes_h_l893_c31_70bb : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_x,
CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output);



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
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output,
 tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 t16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 n16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output,
 tmp16_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 t16_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 n16_MUX_uxn_opcodes_h_l866_c7_2259_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output,
 tmp16_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 t16_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 n16_MUX_uxn_opcodes_h_l869_c7_1506_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output,
 tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 t16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 n16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output,
 BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output,
 tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output,
 n16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output,
 tmp16_MUX_uxn_opcodes_h_l882_c7_253b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_return_output,
 n16_MUX_uxn_opcodes_h_l882_c7_253b_return_output,
 BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_return_output,
 sp_relative_shift_uxn_opcodes_h_l885_c30_2014_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output,
 CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_7b0f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_c8ee : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_70bd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_bf58 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_ecae : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_uxn_opcodes_h_l884_c3_55db : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_8fdb : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_return_output : unsigned(16 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_63cd_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_d53f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_6b22 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_d8a3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l870_l883_DUPLICATE_8dc6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_202d_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l897_l849_DUPLICATE_f44a_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_right := to_unsigned(6, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_7b0f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l863_c3_7b0f;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_right := to_unsigned(2, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_d53f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l892_c3_d53f;
     VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_c8ee := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l858_c3_c8ee;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_bf58 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l872_c3_bf58;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_ecae := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l876_c3_ecae;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_70bd := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l867_c3_70bd;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_right := to_unsigned(3, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_6b22 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l891_c3_6b22;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_8fdb := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l887_c3_8fdb;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_left := t16;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse := tmp16;
     -- CONST_SR_8[uxn_opcodes_h_l893_c31_70bb] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_x <= VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_return_output := CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l874_c11_814a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_left;
     BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output := BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l890_c11_7e8e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_left;
     BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output := BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l882_c11_a729] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_left;
     BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output := BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l878_c11_71bb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_left;
     BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output := BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l885_c30_2014] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l885_c30_2014_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_ins;
     sp_relative_shift_uxn_opcodes_h_l885_c30_2014_x <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_x;
     sp_relative_shift_uxn_opcodes_h_l885_c30_2014_y <= VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_return_output := sp_relative_shift_uxn_opcodes_h_l885_c30_2014_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output := result.is_opc_done;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_98c6_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_202d LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_202d_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l869_c11_5d31] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_left;
     BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output := BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l870_l883_DUPLICATE_8dc6 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l870_l883_DUPLICATE_8dc6_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_98c6_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l853_c6_897b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_left;
     BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output := BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c_return_output := result.is_stack_write;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_98c6_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_98c6_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l866_c11_4476] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_left;
     BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output := BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l853_c6_897b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l866_c11_4476_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l869_c11_5d31_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l874_c11_814a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l878_c11_71bb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l882_c11_a729_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l890_c11_7e8e_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l870_l883_DUPLICATE_8dc6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l870_l883_DUPLICATE_8dc6_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l875_l879_l870_l883_DUPLICATE_8dc6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l869_l874_l890_l878_l866_DUPLICATE_7930_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l869_l882_l874_l890_l878_l866_DUPLICATE_77b5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l869_l882_l874_l878_l866_DUPLICATE_432c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_202d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l890_l878_DUPLICATE_202d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l869_l853_l874_l890_l878_l866_DUPLICATE_eb05_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l853_c2_98c6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l853_c2_98c6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l853_c2_98c6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l853_c2_98c6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l885_c30_2014_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l882_c7_253b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l893_c21_d8a3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_d8a3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l893_c31_70bb_return_output);

     -- result_is_vram_write_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l890_c7_9f9b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l890_c7_9f9b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l890_c7_9f9b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l883_c3_2313] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_left;
     BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output := BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l875_c3_4ce6] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_left;
     BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_return_output := BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l875_c3_4ce6_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_right := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l883_c3_2313_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l893_c21_d8a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l871_l880_DUPLICATE_b119_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l882_c7_253b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l884_c11_87e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l882_c7_253b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l890_c7_9f9b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output := result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l882_c7_253b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_return_output;

     -- t16_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     t16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     t16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := t16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l882_c7_253b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l878_c7_2bf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;

     -- n16_MUX[uxn_opcodes_h_l882_c7_253b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l882_c7_253b_cond <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_cond;
     n16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue;
     n16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_return_output := n16_MUX_uxn_opcodes_h_l882_c7_253b_return_output;

     -- Submodule level 3
     VAR_tmp16_uxn_opcodes_h_l884_c3_55db := resize(VAR_BIN_OP_PLUS_uxn_opcodes_h_l884_c11_87e0_return_output, 16);
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l882_c7_253b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l882_c7_253b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l882_c7_253b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l882_c7_253b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l890_c7_9f9b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_t16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue := VAR_tmp16_uxn_opcodes_h_l884_c3_55db;
     -- n16_MUX[uxn_opcodes_h_l878_c7_2bf5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond;
     n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue;
     n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output := n16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- t16_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     t16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     t16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_return_output := t16_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l882_c7_253b] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l882_c7_253b_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_cond;
     tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iftrue;
     tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_return_output := tmp16_MUX_uxn_opcodes_h_l882_c7_253b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l878_c7_2bf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l888_c21_63cd] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_63cd_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_tmp16_uxn_opcodes_h_l884_c3_55db);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l878_c7_2bf5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l878_c7_2bf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l888_c21_63cd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_t16_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l882_c7_253b_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l882_c7_253b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_return_output := result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_return_output;

     -- t16_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     t16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     t16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_return_output := t16_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l878_c7_2bf5] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_cond;
     tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue;
     tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output := tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;

     -- n16_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     n16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     n16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := n16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_n16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l882_c7_253b_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_t16_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l878_c7_2bf5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output := result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- t16_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     t16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     t16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := t16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- n16_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     n16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     n16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_return_output := n16_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_n16_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l878_c7_2bf5_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- n16_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     n16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     n16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_return_output := n16_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l874_c7_68c0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_return_output := result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_return_output := tmp16_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l874_c7_68c0_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_return_output := tmp16_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l869_c7_1506] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_cond;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_return_output := result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_return_output;

     -- n16_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     n16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     n16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := n16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l869_c7_1506_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l866_c7_2259] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_cond;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_return_output := result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l866_c7_2259_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l853_c2_98c6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_return_output := result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l897_l849_DUPLICATE_f44a LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l897_l849_DUPLICATE_f44a_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l853_c2_98c6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l853_c2_98c6_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l897_l849_DUPLICATE_f44a_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l897_l849_DUPLICATE_f44a_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
