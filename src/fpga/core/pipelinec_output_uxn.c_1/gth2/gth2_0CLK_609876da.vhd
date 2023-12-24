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
-- Submodules: 58
entity gth2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end gth2_0CLK_609876da;
architecture arch of gth2_0CLK_609876da is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_c23f]
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(7 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : signed(3 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_e243]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1844_c2_e243]
signal n16_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1844_c2_e243]
signal t16_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_d214]
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_5cf5]
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_5cf5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_5cf5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_5cf5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_5cf5]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1857_c7_5cf5]
signal n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1857_c7_5cf5]
signal t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_76bf]
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_b2b3]
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_b2b3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_b2b3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_b2b3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_b2b3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1860_c7_b2b3]
signal n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1860_c7_b2b3]
signal t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_c3c8]
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_b8d9]
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_b8d9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_b8d9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_b8d9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_b8d9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1865_c7_b8d9]
signal n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1865_c7_b8d9]
signal t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1866_c3_9bcf]
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_a0e2]
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_0f17]
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_0f17]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_0f17]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_0f17]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_0f17]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1869_c7_0f17]
signal n16_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_bc4c]
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_f201]
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_f201]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_f201]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_f201]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_f201]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1873_c7_f201]
signal n16_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1874_c3_4a8a]
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1875_c30_6153]
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_return_output : signed(3 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1878_c21_687e]
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_left : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_right : unsigned(15 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1878_c21_f5fe]
signal MUX_uxn_opcodes_h_l1878_c21_f5fe_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_f5fe_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_f5fe_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1878_c21_f5fe_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_922a( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned;
 ref_toks_9 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.is_stack_index_flipped := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_vram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_pc_updated := ref_toks_6;
      base.is_opc_done := ref_toks_7;
      base.is_ram_write := ref_toks_8;
      base.is_stack_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_left,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_right,
BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- n16_MUX_uxn_opcodes_h_l1844_c2_e243
n16_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
n16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
n16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
n16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- t16_MUX_uxn_opcodes_h_l1844_c2_e243
t16_MUX_uxn_opcodes_h_l1844_c2_e243 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1844_c2_e243_cond,
t16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue,
t16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse,
t16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_left,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_right,
BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output);

-- n16_MUX_uxn_opcodes_h_l1857_c7_5cf5
n16_MUX_uxn_opcodes_h_l1857_c7_5cf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond,
n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue,
n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse,
n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output);

-- t16_MUX_uxn_opcodes_h_l1857_c7_5cf5
t16_MUX_uxn_opcodes_h_l1857_c7_5cf5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond,
t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue,
t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse,
t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_left,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_right,
BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1860_c7_b2b3
n16_MUX_uxn_opcodes_h_l1860_c7_b2b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond,
n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue,
n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse,
n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output);

-- t16_MUX_uxn_opcodes_h_l1860_c7_b2b3
t16_MUX_uxn_opcodes_h_l1860_c7_b2b3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond,
t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue,
t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse,
t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_left,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_right,
BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output);

-- n16_MUX_uxn_opcodes_h_l1865_c7_b8d9
n16_MUX_uxn_opcodes_h_l1865_c7_b8d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond,
n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue,
n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse,
n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output);

-- t16_MUX_uxn_opcodes_h_l1865_c7_b8d9
t16_MUX_uxn_opcodes_h_l1865_c7_b8d9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond,
t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue,
t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse,
t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf
BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_left,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_right,
BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_left,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_right,
BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_cond,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output);

-- n16_MUX_uxn_opcodes_h_l1869_c7_0f17
n16_MUX_uxn_opcodes_h_l1869_c7_0f17 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1869_c7_0f17_cond,
n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue,
n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse,
n16_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_left,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_right,
BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_cond,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_return_output);

-- n16_MUX_uxn_opcodes_h_l1873_c7_f201
n16_MUX_uxn_opcodes_h_l1873_c7_f201 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1873_c7_f201_cond,
n16_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue,
n16_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse,
n16_MUX_uxn_opcodes_h_l1873_c7_f201_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a
BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_left,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_right,
BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1875_c30_6153
sp_relative_shift_uxn_opcodes_h_l1875_c30_6153 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_ins,
sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_x,
sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_y,
sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e
BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e : entity work.BIN_OP_GT_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_left,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_right,
BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_return_output);

-- MUX_uxn_opcodes_h_l1878_c21_f5fe
MUX_uxn_opcodes_h_l1878_c21_f5fe : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1878_c21_f5fe_cond,
MUX_uxn_opcodes_h_l1878_c21_f5fe_iftrue,
MUX_uxn_opcodes_h_l1878_c21_f5fe_iffalse,
MUX_uxn_opcodes_h_l1878_c21_f5fe_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output);



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
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 n16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 t16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output,
 n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output,
 t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output,
 n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output,
 t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output,
 n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output,
 t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output,
 n16_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_return_output,
 n16_MUX_uxn_opcodes_h_l1873_c7_f201_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output,
 sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_return_output,
 MUX_uxn_opcodes_h_l1878_c21_f5fe_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_363e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_95e4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_237c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_1250 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_be10 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_2718 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_return_output : signed(3 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1874_l1870_l1866_DUPLICATE_dd42_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_11e5_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1882_l1840_DUPLICATE_0735_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_363e := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1854_c3_363e;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_be10 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1867_c3_be10;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_right := to_unsigned(5, 3);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_237c := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1858_c3_237c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_1250 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1863_c3_1250;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_right := to_unsigned(2, 2);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_right := to_unsigned(3, 2);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_95e4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1849_c3_95e4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_2718 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1877_c3_2718;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue := to_unsigned(1, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_left := VAR_phase;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse := t16;
     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_e243_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_11e5 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_11e5_return_output := result.stack_address_sp_offset;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_e243_return_output := result.is_vram_write;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_e243_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1873_c11_bc4c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1844_c6_c23f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1869_c11_a0e2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1860_c11_76bf] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_left;
     BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output := BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1865_c11_c3c8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992_return_output := result.is_opc_done;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_e243_return_output := result.is_stack_index_flipped;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66_return_output := result.is_stack_write;

     -- sp_relative_shift[uxn_opcodes_h_l1875_c30_6153] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_ins;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_x;
     sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_return_output := sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1857_c11_d214] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_left;
     BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output := BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1874_l1870_l1866_DUPLICATE_dd42 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1874_l1870_l1866_DUPLICATE_dd42_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1844_c6_c23f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1857_c11_d214_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1860_c11_76bf_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1865_c11_c3c8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1869_c11_a0e2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1873_c11_bc4c_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1874_l1870_l1866_DUPLICATE_dd42_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1874_l1870_l1866_DUPLICATE_dd42_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1861_l1874_l1870_l1866_DUPLICATE_dd42_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_f836_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_0992_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1860_l1857_l1873_l1869_l1865_DUPLICATE_8c66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_11e5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1869_l1873_DUPLICATE_11e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1860_l1857_l1844_l1873_l1869_l1865_DUPLICATE_984d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1844_c2_e243_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1844_c2_e243_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1844_c2_e243_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1844_c2_e243_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1875_c30_6153_return_output;
     -- result_is_vram_write_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1873_c7_f201] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1866_c3_9bcf] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_left;
     BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_return_output := BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1873_c7_f201] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1873_c7_f201] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1873_c7_f201] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1874_c3_4a8a] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_left;
     BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output := BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1866_c3_9bcf_return_output;
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1874_c3_4a8a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1862_l1871_DUPLICATE_2699_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1869_c7_0f17] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1869_c7_0f17] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1878_c21_687e] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_left;
     BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_return_output := BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1873_c7_f201] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1873_c7_f201_cond <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_cond;
     n16_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue;
     n16_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_return_output := n16_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1869_c7_0f17] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;

     -- t16_MUX[uxn_opcodes_h_l1865_c7_b8d9] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond;
     t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue;
     t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output := t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1869_c7_0f17] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1878_c21_687e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1865_c7_b8d9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1865_c7_b8d9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1865_c7_b8d9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1865_c7_b8d9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;

     -- MUX[uxn_opcodes_h_l1878_c21_f5fe] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1878_c21_f5fe_cond <= VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_cond;
     MUX_uxn_opcodes_h_l1878_c21_f5fe_iftrue <= VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_iftrue;
     MUX_uxn_opcodes_h_l1878_c21_f5fe_iffalse <= VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_return_output := MUX_uxn_opcodes_h_l1878_c21_f5fe_return_output;

     -- n16_MUX[uxn_opcodes_h_l1869_c7_0f17] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1869_c7_0f17_cond <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_cond;
     n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue;
     n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output := n16_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;

     -- t16_MUX[uxn_opcodes_h_l1860_c7_b2b3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond;
     t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue;
     t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output := t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue := VAR_MUX_uxn_opcodes_h_l1878_c21_f5fe_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1860_c7_b2b3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;

     -- t16_MUX[uxn_opcodes_h_l1857_c7_5cf5] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond;
     t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue;
     t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output := t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1865_c7_b8d9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond;
     n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue;
     n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output := n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1873_c7_f201] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_return_output := result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1860_c7_b2b3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1860_c7_b2b3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1860_c7_b2b3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1873_c7_f201_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l1857_c7_5cf5] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1860_c7_b2b3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond;
     n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue;
     n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output := n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1857_c7_5cf5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1857_c7_5cf5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1857_c7_5cf5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;

     -- t16_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     t16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     t16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := t16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1869_c7_0f17] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output := result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1869_c7_0f17_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1865_c7_b8d9] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output := result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- n16_MUX[uxn_opcodes_h_l1857_c7_5cf5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond;
     n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue;
     n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output := n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1865_c7_b8d9_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1860_c7_b2b3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     n16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     n16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := n16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1860_c7_b2b3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1857_c7_5cf5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1857_c7_5cf5_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1844_c2_e243] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_return_output := result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1882_l1840_DUPLICATE_0735 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1882_l1840_DUPLICATE_0735_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_922a(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1844_c2_e243_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1882_l1840_DUPLICATE_0735_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_922a_uxn_opcodes_h_l1882_l1840_DUPLICATE_0735_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
