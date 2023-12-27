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
entity and2_0CLK_50b92fe2 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end and2_0CLK_50b92fe2;
architecture arch of and2_0CLK_50b92fe2 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l939_c6_0e2d]
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l939_c2_7608]
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_return_output : signed(3 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_7608]
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l939_c2_7608]
signal t16_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l939_c2_7608]
signal n16_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l952_c11_da10]
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l952_c7_2e41]
signal tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_2e41]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l952_c7_2e41]
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_2e41]
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_2e41]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_2e41]
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l952_c7_2e41]
signal t16_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l952_c7_2e41]
signal n16_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l955_c11_ba6a]
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l955_c7_0d15]
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_0d15]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l955_c7_0d15]
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_0d15]
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_0d15]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_0d15]
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l955_c7_0d15]
signal t16_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l955_c7_0d15]
signal n16_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l960_c11_4413]
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l960_c7_84e4]
signal tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_84e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l960_c7_84e4]
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_84e4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_84e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_84e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(0 downto 0);

-- t16_MUX[uxn_opcodes_h_l960_c7_84e4]
signal t16_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l960_c7_84e4]
signal n16_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l961_c3_b4ea]
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l964_c11_c5fd]
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l964_c7_4a48]
signal tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_4a48]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l964_c7_4a48]
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_4a48]
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_4a48]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_4a48]
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l964_c7_4a48]
signal n16_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l968_c11_3129]
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l968_c7_2fb3]
signal tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_2fb3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l968_c7_2fb3]
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_2fb3]
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_2fb3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_2fb3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l968_c7_2fb3]
signal n16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l969_c3_1420]
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l970_c11_32ac]
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_left : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_right : unsigned(15 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l971_c30_0736]
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0736_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0736_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0736_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l971_c30_0736_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l976_c11_23bd]
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_76d7]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : unsigned(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l976_c7_76d7]
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_76d7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_76d7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : unsigned(0 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l979_c31_b7b9]
signal CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_return_output : unsigned(15 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output : unsigned(15 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d
BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_left,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_right,
BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l939_c2_7608
tmp16_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l939_c2_7608_cond,
tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
tmp16_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- t16_MUX_uxn_opcodes_h_l939_c2_7608
t16_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l939_c2_7608_cond,
t16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
t16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
t16_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- n16_MUX_uxn_opcodes_h_l939_c2_7608
n16_MUX_uxn_opcodes_h_l939_c2_7608 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l939_c2_7608_cond,
n16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue,
n16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse,
n16_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10
BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_left,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_right,
BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output);

-- tmp16_MUX_uxn_opcodes_h_l952_c7_2e41
tmp16_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41
result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- t16_MUX_uxn_opcodes_h_l952_c7_2e41
t16_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
t16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
t16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
t16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- n16_MUX_uxn_opcodes_h_l952_c7_2e41
n16_MUX_uxn_opcodes_h_l952_c7_2e41 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l952_c7_2e41_cond,
n16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue,
n16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse,
n16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a
BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_left,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_right,
BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output);

-- tmp16_MUX_uxn_opcodes_h_l955_c7_0d15
tmp16_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- t16_MUX_uxn_opcodes_h_l955_c7_0d15
t16_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
t16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
t16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
t16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- n16_MUX_uxn_opcodes_h_l955_c7_0d15
n16_MUX_uxn_opcodes_h_l955_c7_0d15 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l955_c7_0d15_cond,
n16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue,
n16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse,
n16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413
BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_left,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_right,
BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output);

-- tmp16_MUX_uxn_opcodes_h_l960_c7_84e4
tmp16_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4
result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- t16_MUX_uxn_opcodes_h_l960_c7_84e4
t16_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
t16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
t16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
t16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- n16_MUX_uxn_opcodes_h_l960_c7_84e4
n16_MUX_uxn_opcodes_h_l960_c7_84e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l960_c7_84e4_cond,
n16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue,
n16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse,
n16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea
BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_left,
BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_right,
BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd
BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_left,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_right,
BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output);

-- tmp16_MUX_uxn_opcodes_h_l964_c7_4a48
tmp16_MUX_uxn_opcodes_h_l964_c7_4a48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_cond,
tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue,
tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse,
tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48
result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_cond,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_return_output);

-- n16_MUX_uxn_opcodes_h_l964_c7_4a48
n16_MUX_uxn_opcodes_h_l964_c7_4a48 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l964_c7_4a48_cond,
n16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue,
n16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse,
n16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129
BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_left,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_right,
BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output);

-- tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3
tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond,
tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue,
tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse,
tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3
result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_cond,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output);

-- n16_MUX_uxn_opcodes_h_l968_c7_2fb3
n16_MUX_uxn_opcodes_h_l968_c7_2fb3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond,
n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue,
n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse,
n16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l969_c3_1420
BIN_OP_OR_uxn_opcodes_h_l969_c3_1420 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_left,
BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_right,
BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac
BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac : entity work.BIN_OP_AND_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_left,
BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_right,
BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output);

-- sp_relative_shift_uxn_opcodes_h_l971_c30_0736
sp_relative_shift_uxn_opcodes_h_l971_c30_0736 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l971_c30_0736_ins,
sp_relative_shift_uxn_opcodes_h_l971_c30_0736_x,
sp_relative_shift_uxn_opcodes_h_l971_c30_0736_y,
sp_relative_shift_uxn_opcodes_h_l971_c30_0736_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd
BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_left,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_right,
BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7
result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_cond,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9
CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_x,
CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output,
 tmp16_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 t16_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 n16_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output,
 tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 t16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 n16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output,
 tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 t16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 n16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output,
 tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 t16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 n16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output,
 BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output,
 tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_return_output,
 n16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output,
 tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output,
 n16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output,
 BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output,
 sp_relative_shift_uxn_opcodes_h_l971_c30_0736_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_return_output,
 CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_da12 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_8ae4 : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_cc15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_cbd7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_70b7 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_28d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_c209_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_4959 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_bf5d : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_7e77_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_2382_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_2f66_return_output : unsigned(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l935_l983_DUPLICATE_fa7f_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_right := to_unsigned(2, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_28d8 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l973_c3_28d8;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_cbd7 := resize(to_unsigned(4, 3), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l958_c3_cbd7;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_70b7 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l962_c3_70b7;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_4959 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l978_c3_4959;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_right := to_unsigned(1, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_bf5d := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l977_c3_bf5d;
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_x := signed(std_logic_vector(resize(to_unsigned(4, 3), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_right := to_unsigned(4, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_cc15 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l953_c3_cc15;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_right := to_unsigned(6, 3);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := to_unsigned(0, 1);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_8ae4 := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l944_c3_8ae4;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_da12 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l949_c3_da12;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_left := VAR_phase;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_left := t16;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse := tmp16;
     -- BIN_OP_EQ[uxn_opcodes_h_l955_c11_ba6a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_left;
     BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output := BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_7608_return_output := result.is_vram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l952_c11_da10] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_left;
     BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output := BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_2382 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_2382_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l960_c11_4413] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_left;
     BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output := BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_2f66 LATENCY=0
     VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_2f66_return_output := result.stack_address_sp_offset;

     -- result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_7608_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l971_c30_0736] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l971_c30_0736_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_ins;
     sp_relative_shift_uxn_opcodes_h_l971_c30_0736_x <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_x;
     sp_relative_shift_uxn_opcodes_h_l971_c30_0736_y <= VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_return_output := sp_relative_shift_uxn_opcodes_h_l971_c30_0736_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l979_c31_b7b9] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_x <= VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_return_output := CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l939_c6_0e2d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_left;
     BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output := BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l976_c11_23bd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_left;
     BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output := BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l968_c11_3129] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_left;
     BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output := BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l964_c11_c5fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_7608_return_output := result.is_pc_updated;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_7608_return_output := result.is_stack_index_flipped;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l939_c6_0e2d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l952_c11_da10_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l955_c11_ba6a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l960_c11_4413_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l964_c11_c5fd_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l968_c11_3129_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l976_c11_23bd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_2382_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_2382_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l961_l969_l956_l965_DUPLICATE_2382_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l960_l952_l955_l964_l976_DUPLICATE_fb66_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_l976_DUPLICATE_8512_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l960_l952_l968_l955_l964_DUPLICATE_52ff_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_2f66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse := VAR_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l976_l964_DUPLICATE_2f66_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l960_l952_l955_l964_l939_l976_DUPLICATE_7768_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l939_c2_7608_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_is_ram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l939_c2_7608_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l939_c2_7608_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l939_c2_7608_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l971_c30_0736_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l979_c21_7e77] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_7e77_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l979_c31_b7b9_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l976_c7_76d7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l968_c7_2fb3] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l976_c7_76d7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l969_c3_1420] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_left;
     BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output := BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l961_c3_b4ea] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_left;
     BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_return_output := BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_return_output;

     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l976_c7_76d7] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- Submodule level 2
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l961_c3_b4ea_return_output;
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_right := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l969_c3_1420_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l979_c21_7e77_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l957_l966_DUPLICATE_7c09_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l976_c7_76d7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_return_output := result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l970_c11_32ac] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_left;
     BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output := BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l968_c7_2fb3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;

     -- n16_MUX[uxn_opcodes_h_l968_c7_2fb3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond;
     n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue;
     n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output := n16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     t16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     t16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := t16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l968_c7_2fb3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l964_c7_4a48] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l968_c7_2fb3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue := VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse := VAR_n16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l976_c7_76d7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_t16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     -- n16_MUX[uxn_opcodes_h_l964_c7_4a48] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l964_c7_4a48_cond <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_cond;
     n16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue;
     n16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output := n16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l964_c7_4a48] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l974_c21_c209] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_c209_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_BIN_OP_AND_uxn_opcodes_h_l970_c11_32ac_return_output);

     -- tmp16_MUX[uxn_opcodes_h_l968_c7_2fb3] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_cond;
     tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue;
     tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output := tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;

     -- t16_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     t16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     t16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := t16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l964_c7_4a48] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l964_c7_4a48] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l974_c21_c209_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := VAR_n16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_t16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l964_c7_4a48] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_cond;
     tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue;
     tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output := tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;

     -- t16_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     t16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     t16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := t16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- n16_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     n16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     n16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := n16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l968_c7_2fb3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output := result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_n16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l968_c7_2fb3_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_t16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;
     -- t16_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     t16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     t16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_return_output := t16_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l964_c7_4a48] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_cond;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_return_output := result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- n16_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     n16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     n16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := n16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_n16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l964_c7_4a48_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l939_c2_7608_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- n16_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     n16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     n16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := n16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l960_c7_84e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_n16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l960_c7_84e4_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- n16_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     n16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     n16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_return_output := n16_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l955_c7_0d15] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_cond;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_return_output := result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- Submodule level 8
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l939_c2_7608_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l955_c7_0d15_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l952_c7_2e41] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_cond;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_return_output := result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_return_output := tmp16_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- Submodule level 9
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l952_c7_2e41_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l939_c2_7608_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l939_c2_7608] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_cond;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_return_output := result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_return_output;

     -- Submodule level 10
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l935_l983_DUPLICATE_fa7f LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l935_l983_DUPLICATE_fa7f_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_b856(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l939_c2_7608_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l939_c2_7608_return_output);

     -- Submodule level 11
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l935_l983_DUPLICATE_fa7f_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_b856_uxn_opcodes_h_l935_l983_DUPLICATE_fa7f_return_output;
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
