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
-- Submodules: 40
entity stz_0CLK_bacf6a1d is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_bacf6a1d;
architecture arch of stz_0CLK_bacf6a1d is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1538_c6_a8a3]
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal n8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : signed(3 downto 0);

-- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
signal result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(3 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);

-- result_is_pc_updated_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
signal result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(7 downto 0);

-- result_is_vram_write_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
signal result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1538_c2_ec66]
signal t8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1551_c11_d919]
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal n8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1551_c7_7f86]
signal t8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1554_c11_b25b]
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1554_c7_f362]
signal n8_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1554_c7_f362]
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1554_c7_f362]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1554_c7_f362]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1554_c7_f362]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1554_c7_f362]
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1554_c7_f362]
signal t8_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1557_c11_4ad4]
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1557_c7_cfc2]
signal n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1557_c7_cfc2]
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c7_cfc2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c7_cfc2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c7_cfc2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1557_c7_cfc2]
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1559_c30_54af]
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_return_output : signed(3 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
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
-- BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_left,
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_right,
BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output);

-- n8_MUX_uxn_opcodes_h_l1538_c2_ec66
n8_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
n8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- t8_MUX_uxn_opcodes_h_l1538_c2_ec66
t8_MUX_uxn_opcodes_h_l1538_c2_ec66 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond,
t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue,
t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse,
t8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_left,
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_right,
BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output);

-- n8_MUX_uxn_opcodes_h_l1551_c7_7f86
n8_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
n8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- t8_MUX_uxn_opcodes_h_l1551_c7_7f86
t8_MUX_uxn_opcodes_h_l1551_c7_7f86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond,
t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue,
t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse,
t8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_left,
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_right,
BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output);

-- n8_MUX_uxn_opcodes_h_l1554_c7_f362
n8_MUX_uxn_opcodes_h_l1554_c7_f362 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1554_c7_f362_cond,
n8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue,
n8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse,
n8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond,
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond,
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output);

-- t8_MUX_uxn_opcodes_h_l1554_c7_f362
t8_MUX_uxn_opcodes_h_l1554_c7_f362 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1554_c7_f362_cond,
t8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue,
t8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse,
t8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_left,
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_right,
BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output);

-- n8_MUX_uxn_opcodes_h_l1557_c7_cfc2
n8_MUX_uxn_opcodes_h_l1557_c7_cfc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond,
n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue,
n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse,
n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1559_c30_54af
sp_relative_shift_uxn_opcodes_h_l1559_c30_54af : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_ins,
sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_x,
sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_y,
sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output,
 n8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 t8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output,
 n8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 t8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output,
 n8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output,
 t8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output,
 n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1543_c3_7bcf : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_b28b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(0 downto 0);
 variable VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1552_c3_02ed : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_c7_7f86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1561_c22_d0b7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_a767_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_23fe_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_f422_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7320_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_dc87_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1566_l1534_DUPLICATE_67d2_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n8 := n8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := to_unsigned(0, 1);
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1552_c3_02ed := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1552_c3_02ed;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_right := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue := to_unsigned(1, 1);
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_right := to_unsigned(2, 2);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1543_c3_7bcf := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1543_c3_7bcf;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_b28b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1548_c3_b28b;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := to_unsigned(0, 1);

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse := t8;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7320 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7320_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1551_c11_d919] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_left;
     BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output := BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1559_c30_54af] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_ins;
     sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_x;
     sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_return_output := sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_a767 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_a767_return_output := result.u16_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_dc87 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_dc87_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_23fe LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_23fe_return_output := result.u8_value;

     -- result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output := result.is_pc_updated;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_f422 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_f422_return_output := result.is_opc_done;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_c7_7f86_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1557_c11_4ad4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output;

     -- result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output := result.is_stack_index_flipped;

     -- BIN_OP_EQ[uxn_opcodes_h_l1538_c6_a8a3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1561_c22_d0b7] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1561_c22_d0b7_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output := result.is_stack_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1554_c11_b25b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;

     -- result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output := result.is_vram_write;

     -- Submodule level 1
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1538_c6_a8a3_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1551_c11_d919_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1554_c11_b25b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1557_c11_4ad4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1561_c22_d0b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_dc87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_dc87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_dc87_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_a767_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_a767_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_a767_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_a767_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_f422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_f422_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_f422_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7320_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7320_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1554_l1557_l1551_DUPLICATE_7320_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_23fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_23fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_23fe_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1554_l1538_l1557_l1551_DUPLICATE_23fe_return_output;
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_is_pc_updated_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_pc_updated_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output;
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_is_stack_index_flipped_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_index_flipped_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_is_stack_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output;
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_is_vram_write_FALSE_INPUT_MUX_CONST_REF_RD_uint1_t_opcode_result_t_is_vram_write_d41d_uxn_opcodes_h_l1538_c2_ec66_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1551_c7_7f86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1559_c30_54af_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1557_c7_cfc2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1557_c7_cfc2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1557_c7_cfc2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1557_c7_cfc2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond;
     n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue;
     n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output := n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1554_c7_f362] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1554_c7_f362_cond <= VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_cond;
     t8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue;
     t8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output := t8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1557_c7_cfc2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- result_is_stack_index_flipped_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- result_is_vram_write_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1557_c7_cfc2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- result_is_pc_updated_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- Submodule level 2
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1557_c7_cfc2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1554_c7_f362] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1554_c7_f362] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output := result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;

     -- n8_MUX[uxn_opcodes_h_l1554_c7_f362] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1554_c7_f362_cond <= VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_cond;
     n8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue;
     n8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output := n8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- t8_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := t8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1554_c7_f362] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1554_c7_f362] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1554_c7_f362] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output := result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1554_c7_f362_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- n8_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := n8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1551_c7_7f86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;

     -- t8_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := t8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1551_c7_7f86_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- n8_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := n8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1538_c2_ec66] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output := result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;

     -- Submodule level 5
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output;
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1566_l1534_DUPLICATE_67d2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1566_l1534_DUPLICATE_67d2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_42c1(
     result,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_is_stack_index_flipped_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_is_pc_updated_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output,
     VAR_result_is_vram_write_MUX_uxn_opcodes_h_l1538_c2_ec66_return_output);

     -- Submodule level 6
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1566_l1534_DUPLICATE_67d2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_42c1_uxn_opcodes_h_l1566_l1534_DUPLICATE_67d2_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n8 <= REG_VAR_n8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n8 <= REG_COMB_n8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
