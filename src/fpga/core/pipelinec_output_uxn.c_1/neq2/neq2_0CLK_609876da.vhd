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
entity neq2_0CLK_609876da is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end neq2_0CLK_609876da;
architecture arch of neq2_0CLK_609876da is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_410d]
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(7 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_b8f3]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_09b3]
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1290_c7_ab18]
signal n16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1290_c7_ab18]
signal t16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_ab18]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_ab18]
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_ab18]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_ab18]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_ab18]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_e5af]
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1293_c7_c52b]
signal n16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1293_c7_c52b]
signal t16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_c52b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_c52b]
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_c52b]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_c52b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_c52b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_023e]
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1298_c7_fe40]
signal n16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(15 downto 0);

-- t16_MUX[uxn_opcodes_h_l1298_c7_fe40]
signal t16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_fe40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_fe40]
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_fe40]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_fe40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_fe40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1299_c3_9011]
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_fa83]
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1302_c7_acb3]
signal n16_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_acb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_acb3]
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_acb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_acb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_acb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(3 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1305_c30_7b45]
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_f8a6]
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1307_c7_a329]
signal n16_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_a329]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_a329]
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_a329]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_a329]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_a329]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(3 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1308_c3_ee99]
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_808f]
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_left : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_right : unsigned(15 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1312_c21_afd8]
signal MUX_uxn_opcodes_h_l1312_c21_afd8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_afd8_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_afd8_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1312_c21_afd8_return_output : unsigned(7 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output : unsigned(15 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_ee25( ref_toks_0 : opcode_result_t;
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
      base.is_ram_write := ref_toks_2;
      base.is_stack_write := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_stack_index_flipped := ref_toks_6;
      base.u8_value := ref_toks_7;
      base.is_pc_updated := ref_toks_8;
      base.is_vram_write := ref_toks_9;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_left,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_right,
BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output);

-- n16_MUX_uxn_opcodes_h_l1277_c2_b8f3
n16_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- t16_MUX_uxn_opcodes_h_l1277_c2_b8f3
t16_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_left,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_right,
BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output);

-- n16_MUX_uxn_opcodes_h_l1290_c7_ab18
n16_MUX_uxn_opcodes_h_l1290_c7_ab18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond,
n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue,
n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse,
n16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output);

-- t16_MUX_uxn_opcodes_h_l1290_c7_ab18
t16_MUX_uxn_opcodes_h_l1290_c7_ab18 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond,
t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue,
t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse,
t16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_cond,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_left,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_right,
BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output);

-- n16_MUX_uxn_opcodes_h_l1293_c7_c52b
n16_MUX_uxn_opcodes_h_l1293_c7_c52b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond,
n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue,
n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse,
n16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output);

-- t16_MUX_uxn_opcodes_h_l1293_c7_c52b
t16_MUX_uxn_opcodes_h_l1293_c7_c52b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond,
t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue,
t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse,
t16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_left,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_right,
BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output);

-- n16_MUX_uxn_opcodes_h_l1298_c7_fe40
n16_MUX_uxn_opcodes_h_l1298_c7_fe40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond,
n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue,
n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse,
n16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output);

-- t16_MUX_uxn_opcodes_h_l1298_c7_fe40
t16_MUX_uxn_opcodes_h_l1298_c7_fe40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond,
t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue,
t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse,
t16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_cond,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_left,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_right,
BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_left,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_right,
BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output);

-- n16_MUX_uxn_opcodes_h_l1302_c7_acb3
n16_MUX_uxn_opcodes_h_l1302_c7_acb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1302_c7_acb3_cond,
n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue,
n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse,
n16_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45
sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_ins,
sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_x,
sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_y,
sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_left,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_right,
BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output);

-- n16_MUX_uxn_opcodes_h_l1307_c7_a329
n16_MUX_uxn_opcodes_h_l1307_c7_a329 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1307_c7_a329_cond,
n16_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue,
n16_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse,
n16_MUX_uxn_opcodes_h_l1307_c7_a329_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_cond,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99
BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_left,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_right,
BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f : entity work.BIN_OP_EQ_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_left,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_right,
BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_return_output);

-- MUX_uxn_opcodes_h_l1312_c21_afd8
MUX_uxn_opcodes_h_l1312_c21_afd8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1312_c21_afd8_cond,
MUX_uxn_opcodes_h_l1312_c21_afd8_iftrue,
MUX_uxn_opcodes_h_l1312_c21_afd8_iffalse,
MUX_uxn_opcodes_h_l1312_c21_afd8_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936
CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output,
 n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output,
 n16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output,
 t16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output,
 n16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output,
 t16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output,
 n16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output,
 t16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output,
 n16_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output,
 n16_MUX_uxn_opcodes_h_l1307_c7_a329_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_return_output,
 MUX_uxn_opcodes_h_l1312_c21_afd8_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_1a68 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_915f : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_02f4 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_b90a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_7034 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_return_output : signed(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_0abb : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_3b17 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_iffalse : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_6397_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1294_l1308_DUPLICATE_3687_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_a217_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1316_l1273_DUPLICATE_40a7_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_915f := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1287_c3_915f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_b90a := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1296_c3_b90a;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := to_unsigned(0, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_7034 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1300_c3_7034;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_3b17 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1311_c3_3b17;
     VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_iftrue := resize(to_unsigned(0, 1), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_iffalse := resize(to_unsigned(1, 1), 8);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_0abb := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1309_c3_0abb;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_1a68 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1282_c3_1a68;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_02f4 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1291_c3_02f4;
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_right := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse := t16;
     -- BIN_OP_EQ[uxn_opcodes_h_l1293_c11_e5af] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_left;
     BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output := BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1307_c11_f8a6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1302_c11_fa83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_left;
     BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output := BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1305_c30_7b45] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_ins;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_x;
     sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_return_output := sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1298_c11_023e] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_left;
     BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output := BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1277_c6_410d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_6397 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_6397_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260_return_output := result.is_stack_write;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output := result.is_vram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1294_l1308_DUPLICATE_3687 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1294_l1308_DUPLICATE_3687_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1290_c11_09b3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_a217 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_a217_return_output := result.stack_address_sp_offset;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output := result.is_stack_index_flipped;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output := result.is_pc_updated;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1277_c6_410d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1290_c11_09b3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1293_c11_e5af_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1298_c11_023e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1302_c11_fa83_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1307_c11_f8a6_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1294_l1308_DUPLICATE_3687_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1294_l1308_DUPLICATE_3687_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1299_l1303_l1294_l1308_DUPLICATE_3687_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_6397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_6397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_6397_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1298_l1290_l1293_l1307_DUPLICATE_6397_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_6bcc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1307_DUPLICATE_3260_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_a217_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1302_l1307_DUPLICATE_a217_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1302_l1298_l1293_l1290_l1277_l1307_DUPLICATE_975a_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1277_c2_b8f3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1305_c30_7b45_return_output;
     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1307_c7_a329] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1307_c7_a329] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1307_c7_a329] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1307_c7_a329] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1299_c3_9011] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_left;
     BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_return_output := BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1308_c3_ee99] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_left;
     BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output := BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1299_c3_9011_return_output;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_left := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1308_c3_ee99_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l1304_l1295_DUPLICATE_1936_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;
     -- t16_MUX[uxn_opcodes_h_l1298_c7_fe40] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond;
     t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue;
     t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output := t16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;

     -- n16_MUX[uxn_opcodes_h_l1307_c7_a329] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1307_c7_a329_cond <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_cond;
     n16_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue;
     n16_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_return_output := n16_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1302_c7_acb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1302_c7_acb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1302_c7_acb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1302_c7_acb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1312_c21_808f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_return_output;

     -- Submodule level 3
     VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1312_c21_808f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;
     -- t16_MUX[uxn_opcodes_h_l1293_c7_c52b] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond;
     t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue;
     t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output := t16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1298_c7_fe40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1298_c7_fe40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;

     -- n16_MUX[uxn_opcodes_h_l1302_c7_acb3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1302_c7_acb3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_cond;
     n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue;
     n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output := n16_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1298_c7_fe40] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1298_c7_fe40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;

     -- MUX[uxn_opcodes_h_l1312_c21_afd8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1312_c21_afd8_cond <= VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_cond;
     MUX_uxn_opcodes_h_l1312_c21_afd8_iftrue <= VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_iftrue;
     MUX_uxn_opcodes_h_l1312_c21_afd8_iffalse <= VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_return_output := MUX_uxn_opcodes_h_l1312_c21_afd8_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue := VAR_MUX_uxn_opcodes_h_l1312_c21_afd8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1293_c7_c52b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1293_c7_c52b] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1293_c7_c52b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1298_c7_fe40] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_cond;
     n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue;
     n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output := n16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;

     -- t16_MUX[uxn_opcodes_h_l1290_c7_ab18] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond;
     t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue;
     t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output := t16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1307_c7_a329] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_return_output := result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1293_c7_c52b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1307_c7_a329_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_t16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1302_c7_acb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1293_c7_c52b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_cond;
     n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue;
     n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output := n16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1290_c7_ab18] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1290_c7_ab18] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1290_c7_ab18] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;

     -- t16_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1290_c7_ab18] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1302_c7_acb3_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1290_c7_ab18] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_cond;
     n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue;
     n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output := n16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1298_c7_fe40] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output := result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1298_c7_fe40_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1293_c7_c52b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1293_c7_c52b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1290_c7_ab18] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output := result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1290_c7_ab18_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1277_c2_b8f3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1316_l1273_DUPLICATE_40a7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1316_l1273_DUPLICATE_40a7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_ee25(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1277_c2_b8f3_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1316_l1273_DUPLICATE_40a7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_ee25_uxn_opcodes_h_l1316_l1273_DUPLICATE_40a7_return_output;
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
