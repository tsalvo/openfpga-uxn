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
-- Submodules: 60
entity ldz2_0CLK_2ab048cc is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldz2_0CLK_2ab048cc;
architecture arch of ldz2_0CLK_2ab048cc is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1499_c6_1d7a]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1499_c2_7fd1]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_1a6b]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal t8_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1512_c7_fb58]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_2df0]
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1515_c7_251c]
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1515_c7_251c]
signal t8_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1515_c7_251c]
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_251c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1515_c7_251c]
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1515_c7_251c]
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1515_c7_251c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1515_c7_251c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_251c]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1517_c30_3e2c]
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1520_c11_b202]
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1520_c7_c869]
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1520_c7_c869]
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1520_c7_c869]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1520_c7_c869]
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1520_c7_c869]
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1520_c7_c869]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : signed(3 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1520_c7_c869]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1520_c7_c869]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1522_c33_5ca5]
signal BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_6ae4]
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output : unsigned(0 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1524_c7_3662]
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(7 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_3662]
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_3662]
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_3662]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1524_c7_3662]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_3662]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1530_c11_d3b8]
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1530_c7_5694]
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1530_c7_5694]
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1530_c7_5694]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1530_c7_5694]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_1a75( ref_toks_0 : opcode_result_t;
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
      base.is_opc_done := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.u16_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_stack_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_vram_write := ref_toks_7;
      base.u8_value := ref_toks_8;
      base.stack_address_sp_offset := ref_toks_9;
      base.is_pc_updated := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- t8_MUX_uxn_opcodes_h_l1499_c2_7fd1
t8_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- t8_MUX_uxn_opcodes_h_l1512_c7_fb58
t8_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
t8_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_left,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_right,
BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- t8_MUX_uxn_opcodes_h_l1515_c7_251c
t8_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
t8_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
t8_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
t8_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c
sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_ins,
sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_x,
sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_y,
sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_left,
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_right,
BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_left,
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_right,
BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_left,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_right,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_cond,
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_cond,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_cond,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_left,
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_right,
BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_cond,
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_cond,
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8_high,
 tmp8_low,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 t8_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 t8_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1504_c3_4e6b : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_c198 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1513_c3_abd3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1518_c22_d375_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1521_c3_b21d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1522_c22_fcdc_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_9be3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_2732 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1520_l1512_DUPLICATE_87d1_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_4e97_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1524_l1515_l1520_l1512_DUPLICATE_081b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1515_l1530_l1520_DUPLICATE_02ca_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1495_l1537_DUPLICATE_d39f_return_output : opcode_result_t;
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
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1521_c3_b21d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1521_c3_b21d;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1504_c3_4e6b := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1504_c3_4e6b;
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_right := to_unsigned(1, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_c198 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1509_c3_c198;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1513_c3_abd3 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1513_c3_abd3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_9be3 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1527_c3_9be3;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_right := to_unsigned(2, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_2732 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1532_c3_2732;

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse := tmp8_low;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1520_l1512_DUPLICATE_87d1 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1520_l1512_DUPLICATE_87d1_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1517_c30_3e2c] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_ins;
     sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_x;
     sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_return_output := sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1515_c11_2df0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_6ae4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1524_l1515_l1520_l1512_DUPLICATE_081b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1524_l1515_l1520_l1512_DUPLICATE_081b_return_output := result.is_stack_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1518_c22_d375] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1518_c22_d375_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1520_c11_b202] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_left;
     BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output := BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1515_l1530_l1520_DUPLICATE_02ca LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1515_l1530_l1520_DUPLICATE_02ca_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1530_c11_d3b8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_1a6b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c6_1d7a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output := result.is_stack_index_flipped;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1522_c33_5ca5] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_4e97 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_4e97_return_output := result.sp_relative_shift;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c6_1d7a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_1a6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1515_c11_2df0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1520_c11_b202_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_6ae4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1530_c11_d3b8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1518_c22_d375_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_4e97_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1520_l1512_DUPLICATE_4e97_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1520_l1512_DUPLICATE_87d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1520_l1512_DUPLICATE_87d1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1499_l1520_l1512_DUPLICATE_87d1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1515_l1512_l1530_l1524_l1520_DUPLICATE_9425_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1524_l1515_l1520_l1512_DUPLICATE_081b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1524_l1515_l1520_l1512_DUPLICATE_081b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1524_l1515_l1520_l1512_DUPLICATE_081b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1524_l1515_l1520_l1512_DUPLICATE_081b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1515_l1530_l1520_DUPLICATE_02ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1515_l1530_l1520_DUPLICATE_02ca_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1515_l1530_l1520_DUPLICATE_02ca_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1515_l1512_l1499_l1530_l1520_DUPLICATE_7951_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1499_c2_7fd1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1517_c30_3e2c_return_output;
     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1530_c7_5694] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_return_output := tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1524_c7_3662] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_return_output := tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1530_c7_5694] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_return_output := result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1524_c7_3662] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1530_c7_5694] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1530_c7_5694] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1522_c22_fcdc] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1522_c22_fcdc_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1522_c33_5ca5_return_output);

     -- t8_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     t8_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     t8_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := t8_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1522_c22_fcdc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1530_c7_5694_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_3662] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_return_output := tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_3662] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_3662] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_return_output := result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- t8_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := t8_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_3662] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_3662_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- t8_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1520_c7_c869] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output := result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1520_c7_c869_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1515_c7_251c] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_return_output := tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1515_c7_251c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1512_c7_fb58] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output := tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1512_c7_fb58_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1499_c2_7fd1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1495_l1537_DUPLICATE_d39f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1495_l1537_DUPLICATE_d39f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_1a75(
     result,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1499_c2_7fd1_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1495_l1537_DUPLICATE_d39f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_1a75_uxn_opcodes_h_l1495_l1537_DUPLICATE_d39f_return_output;
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
