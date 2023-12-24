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
-- BIN_OP_EQ[uxn_opcodes_h_l1493_c6_e0f0]
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1493_c2_2262]
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1493_c2_2262]
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1493_c2_2262]
signal t8_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c2_2262]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_fbfc]
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal t8_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_bce9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_5330]
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal t8_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_6b85]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(0 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1511_c30_599e]
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_9b6a]
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : signed(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_bc98]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1516_c33_6b5e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_dfd5]
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1518_c7_a7e0]
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(7 downto 0);

-- tmp8_high_MUX[uxn_opcodes_h_l1518_c7_a7e0]
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(7 downto 0);
signal tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_a7e0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_a7e0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_a7e0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1518_c7_a7e0]
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_7c4a]
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output : unsigned(0 downto 0);

-- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_2076]
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(7 downto 0);
signal tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_2076]
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_2076]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_2076]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_left,
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_right,
BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- t8_MUX_uxn_opcodes_h_l1493_c2_2262
t8_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
t8_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
t8_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
t8_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_left,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_right,
BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- t8_MUX_uxn_opcodes_h_l1506_c7_bce9
t8_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
t8_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_left,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_right,
BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- t8_MUX_uxn_opcodes_h_l1509_c7_6b85
t8_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
t8_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1511_c30_599e
sp_relative_shift_uxn_opcodes_h_l1511_c30_599e : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_ins,
sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_x,
sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_y,
sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_left,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_right,
BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_left,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_right,
BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond,
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output);

-- tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond,
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue,
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse,
tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_left,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_right,
BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output);

-- tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_cond,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse,
tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_cond,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 t8_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 t8_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 t8_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output,
 sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output,
 tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output,
 tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_b7d9 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_fae4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1507_c3_7c22 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1512_c22_c112_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_b6d1 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1516_c22_8c7b_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1521_c3_bc69 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output : unsigned(0 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1526_c3_5f06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_8885_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_b488_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_2c2e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_43be_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1489_l1531_DUPLICATE_aae4_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1507_c3_7c22 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1507_c3_7c22;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1521_c3_bc69 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1521_c3_bc69;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_b6d1 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1515_c3_b6d1;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_fae4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1503_c3_fae4;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_right := to_unsigned(4, 3);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_y := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_b7d9 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1498_c3_b7d9;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_right := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1526_c3_5f06 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1526_c3_5f06;
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_x := signed(std_logic_vector(resize(to_unsigned(1, 1), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_ins := VAR_ins;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_left := VAR_phase;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue := VAR_previous_ram_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue := VAR_previous_ram_read;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue := VAR_previous_ram_read;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := t8;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := tmp8_high;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse := tmp8_high;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue := tmp8_low;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse := tmp8_low;
     -- BIN_OP_EQ[uxn_opcodes_h_l1506_c11_fbfc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1493_c2_2262_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1514_c11_9b6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1493_c2_2262_return_output := result.is_pc_updated;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1516_c33_6b5e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1493_c6_e0f0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1524_c11_7c4a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1493_c2_2262_return_output := result.is_vram_write;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_8885 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_8885_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1518_c11_dfd5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1493_c2_2262_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_2c2e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_2c2e_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1511_c30_599e] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_ins;
     sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_x;
     sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_return_output := sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1509_c11_5330] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_left;
     BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output := BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_b488 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_b488_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_43be LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_43be_return_output := result.stack_address_sp_offset;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1512_c22_c112] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1512_c22_c112_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- Submodule level 1
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1493_c6_e0f0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1506_c11_fbfc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1509_c11_5330_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1514_c11_9b6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1518_c11_dfd5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1524_c11_7c4a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1512_c22_c112_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_b488_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1506_l1514_DUPLICATE_b488_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_8885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_8885_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1506_l1493_l1514_DUPLICATE_8885_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1524_l1518_l1514_l1509_l1506_DUPLICATE_ce11_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_2c2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_2c2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_2c2e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1506_l1518_l1509_l1514_DUPLICATE_2c2e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_43be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_43be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1509_l1524_l1514_DUPLICATE_43be_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1524_l1514_l1509_l1506_l1493_DUPLICATE_7f8a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1493_c2_2262_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1493_c2_2262_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1493_c2_2262_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1493_c2_2262_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1511_c30_599e_return_output;
     -- t8_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := t8_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1516_c22_8c7b] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1516_c22_8c7b_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1516_c33_6b5e_return_output);

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1518_c7_a7e0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1518_c7_a7e0] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output := tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1524_c7_2076] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1524_c7_2076] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_return_output := result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1524_c7_2076] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_return_output := tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1524_c7_2076] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;

     -- Submodule level 2
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1516_c22_8c7b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1524_c7_2076_return_output;
     -- tmp8_low_MUX[uxn_opcodes_h_l1518_c7_a7e0] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output := tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1518_c7_a7e0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1518_c7_a7e0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- t8_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := t8_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1518_c7_a7e0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- Submodule level 3
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1518_c7_a7e0_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1514_c7_bc98] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;

     -- t8_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     t8_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     t8_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := t8_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1514_c7_bc98_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1509_c7_6b85] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output := tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_tmp8_high_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1509_c7_6b85_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- tmp8_high_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1506_c7_bce9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     REG_VAR_tmp8_high := VAR_tmp8_high_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse := VAR_tmp8_low_MUX_uxn_opcodes_h_l1506_c7_bce9_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- tmp8_low_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1493_c2_2262] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output := result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;

     -- Submodule level 7
     REG_VAR_tmp8_low := VAR_tmp8_low_MUX_uxn_opcodes_h_l1493_c2_2262_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1489_l1531_DUPLICATE_aae4 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1489_l1531_DUPLICATE_aae4_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_775a(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1493_c2_2262_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1493_c2_2262_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1489_l1531_DUPLICATE_aae4_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_775a_uxn_opcodes_h_l1489_l1531_DUPLICATE_aae4_return_output;
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
