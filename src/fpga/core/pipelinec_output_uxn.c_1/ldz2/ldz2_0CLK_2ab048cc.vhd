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
-- BIN_OP_EQ[uxn_opcodes_h_l1493_c6_3fe1]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c2_51d6]
signal t8_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_c3de]
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1506_c7_e691]
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1506_c7_e691]
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_e691]
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_e691]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_e691]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_e691]
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1506_c7_e691]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_e691]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1506_c7_e691]
signal t8_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_b288]
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1509_c7_5fc3]
signal t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1511_c30_9197]
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_0868]
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1514_c7_6761]
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1514_c7_6761]
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1514_c7_6761]
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_6761]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_6761]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1514_c7_6761]
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_6761]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_6761]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1516_c33_044b]
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_90f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1518_c7_0c74]
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1518_c7_0c74]
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1518_c7_0c74]
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_0c74]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_0c74]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_0c74]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_2671]
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_c710]
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_c710]
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_c710]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_c710]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(3 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_42c1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned;
 ref_toks_10 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_ram_write := ref_toks_1;
      base.is_opc_done := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_stack_index_flipped := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_pc_updated := ref_toks_7;
      base.u16_value := ref_toks_8;
      base.u8_value := ref_toks_9;
      base.is_vram_write := ref_toks_10;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c2_51d6
t8_MUX_uxn_opcodes_h_l1493_c2_51d6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c2_51d6_cond,
t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_left,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_right,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- t8_MUX_uxn_opcodes_h_l1506_c7_e691
t8_MUX_uxn_opcodes_h_l1506_c7_e691 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1506_c7_e691_cond,
t8_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue,
t8_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse,
t8_MUX_uxn_opcodes_h_l1506_c7_e691_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_left,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_right,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- t8_MUX_uxn_opcodes_h_l1509_c7_5fc3
t8_MUX_uxn_opcodes_h_l1509_c7_5fc3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond,
t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue,
t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse,
t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1511_c30_9197
sp_relative_shift_uxn_opcodes_h_l1511_c30_9197 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_ins,
sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_x,
sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_y,
sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_left,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_right,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_left,
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_right,
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_cond,
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_cond,
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_cond,
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_left,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_right,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_cond,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_cond,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 t8_MUX_uxn_opcodes_h_l1506_c7_e691_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_3a27 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_21a4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1507_c3_bc2f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1512_c22_a613_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_7a72 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1516_c22_2658_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1521_c3_e46a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1526_c3_27a1 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_6d89_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_1573_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_597b_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_c415_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1489_l1531_DUPLICATE_47fc_return_output : opcode_result_t;
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
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1521_c3_e46a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1521_c3_e46a;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_3a27 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_3a27;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_right := to_unsigned(2, 2);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_7a72 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_7a72;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_21a4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_21a4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1507_c3_bc2f := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1507_c3_bc2f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1526_c3_27a1 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1526_c3_27a1;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_c3de] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_left;
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output := BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1516_c33_044b] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_c415 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_c415_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c6_3fe1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_2671] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_left;
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output := BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_90f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d_return_output := result.u8_value;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_b288] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_left;
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output := BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_0868] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_left;
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output := BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769_return_output := result.is_opc_done;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_6d89 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_6d89_return_output := result.u16_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_597b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_597b_return_output := result.is_stack_write;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output := result.is_stack_index_flipped;

     -- sp_relative_shift[uxn_opcodes_h_l1511_c30_9197] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_ins;
     sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_x;
     sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_return_output := sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_1573 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_1573_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1512_c22_a613] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1512_c22_a613_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_3fe1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_c3de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_b288_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_0868_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_90f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_2671_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1512_c22_a613_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_1573_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_1573_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_6d89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_6d89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_6d89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1518_l1514_l1509_l1506_l1524_DUPLICATE_1769_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_597b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_597b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_597b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_597b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_c415_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_c415_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_c415_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1514_l1509_l1506_l1493_l1524_DUPLICATE_231d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1493_c2_51d6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_9197_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1518_c7_0c74] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output := tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_c710] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_return_output := result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_c710] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_return_output := tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1516_c22_2658] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1516_c22_2658_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_044b_return_output);

     -- t8_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_c710] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_0c74] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_c710] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1516_c22_2658_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_c710_return_output;
     -- tmp8_high_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- t8_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     t8_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     t8_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := t8_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1518_c7_0c74] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output := result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_0c74] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1518_c7_0c74] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output := tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_0c74] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_0c74_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1514_c7_6761] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output := result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := t8_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_6761_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1509_c7_5fc3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_5fc3_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1506_c7_e691] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_return_output := tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_e691_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c2_51d6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1489_l1531_DUPLICATE_47fc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1489_l1531_DUPLICATE_47fc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_51d6_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1489_l1531_DUPLICATE_47fc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1489_l1531_DUPLICATE_47fc_return_output;
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
