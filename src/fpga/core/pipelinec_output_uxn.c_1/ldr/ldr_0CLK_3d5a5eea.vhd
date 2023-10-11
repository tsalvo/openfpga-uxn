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
-- Submodules: 57
entity ldr_0CLK_3d5a5eea is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ldr_0CLK_3d5a5eea;
architecture arch of ldr_0CLK_3d5a5eea is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal tmp8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_tmp8 : unsigned(7 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1724_c6_c639]
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1724_c1_61b7]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1724_c2_c2b9]
signal tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1725_c3_0673[uxn_opcodes_h_l1725_c3_0673]
signal printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1729_c11_8ee7]
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1729_c7_1872]
signal t8_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1729_c7_1872]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1729_c7_1872]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1729_c7_1872]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c7_1872]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c7_1872]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1729_c7_1872]
signal result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1729_c7_1872]
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1729_c7_1872]
signal tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1732_c11_996c]
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1732_c7_9852]
signal t8_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1732_c7_9852]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1732_c7_9852]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1732_c7_9852]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : signed(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1732_c7_9852]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1732_c7_9852]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1732_c7_9852]
signal result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1732_c7_9852]
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1732_c7_9852]
signal tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1735_c32_0a0b]
signal BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1735_c32_d9d2]
signal BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1735_c32_179d]
signal MUX_uxn_opcodes_h_l1735_c32_179d_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1735_c32_179d_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1735_c32_179d_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1735_c32_179d_return_output : signed(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1736_c21_5f13]
signal BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_d50b]
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1738_c7_bcfc]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_bcfc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1738_c7_bcfc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_bcfc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1738_c7_bcfc]
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(15 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1738_c7_bcfc]
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(7 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1738_c7_bcfc]
signal tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1740_c21_612e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_left : signed(16 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_right : signed(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_return_output : signed(17 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_6f81]
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_66d0]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1742_c7_66d0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1742_c7_66d0]
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_66d0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(0 downto 0);

-- tmp8_MUX[uxn_opcodes_h_l1742_c7_66d0]
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(7 downto 0);
signal tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_76f2]
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_0990]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_0990]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_return_output : unsigned(0 downto 0);

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_3413( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_write := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.ram_addr := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639
BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_left,
BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_right,
BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_return_output);

-- t8_MUX_uxn_opcodes_h_l1724_c2_c2b9
t8_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9
result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9
result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9
result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9
tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond,
tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue,
tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse,
tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

-- printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673
printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673 : entity work.printf_uxn_opcodes_h_l1725_c3_0673_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_left,
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_right,
BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output);

-- t8_MUX_uxn_opcodes_h_l1729_c7_1872
t8_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
t8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
t8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
t8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872
result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1729_c7_1872
tmp8_MUX_uxn_opcodes_h_l1729_c7_1872 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_cond,
tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue,
tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse,
tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_left,
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_right,
BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output);

-- t8_MUX_uxn_opcodes_h_l1732_c7_9852
t8_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
t8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
t8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
t8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852
result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1732_c7_9852
tmp8_MUX_uxn_opcodes_h_l1732_c7_9852 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_cond,
tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue,
tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse,
tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b
BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_left,
BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_right,
BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2
BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_left,
BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_right,
BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_return_output);

-- MUX_uxn_opcodes_h_l1735_c32_179d
MUX_uxn_opcodes_h_l1735_c32_179d : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1735_c32_179d_cond,
MUX_uxn_opcodes_h_l1735_c32_179d_iftrue,
MUX_uxn_opcodes_h_l1735_c32_179d_iffalse,
MUX_uxn_opcodes_h_l1735_c32_179d_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13
BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_left,
BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_right,
BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_left,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_right,
BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc
tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond,
tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue,
tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse,
tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_left,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_right,
BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_cond,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output);

-- tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0
tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_cond,
tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue,
tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse,
tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_left,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_right,
BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t8,
 tmp8,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_return_output,
 t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output,
 t8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output,
 t8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_return_output,
 MUX_uxn_opcodes_h_l1735_c32_179d_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output,
 tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output,
 tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1726_c3_9e73 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_06ba : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1736_c3_c019 : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1735_c32_179d_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1735_c32_179d_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1735_c32_179d_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1735_c32_179d_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1736_c26_2303_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_725c : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_left : signed(16 downto 0);
 variable VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_f419_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_return_output : signed(17 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1745_c3_c90b : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse : unsigned(7 downto 0);
 variable VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1724_l1729_l1732_DUPLICATE_f1d1_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_9196_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_4871_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1742_l1732_DUPLICATE_f04a_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1753_l1720_DUPLICATE_c155_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_tmp8 : unsigned(7 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_tmp8 := tmp8;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_right := to_unsigned(3, 2);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_right := to_unsigned(3, 2);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_06ba := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1730_c3_06ba;
     VAR_MUX_uxn_opcodes_h_l1735_c32_179d_iffalse := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1745_c3_c90b := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1745_c3_c90b;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1726_c3_9e73 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1726_c3_9e73;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_right := to_unsigned(4, 3);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l1735_c32_179d_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));

 -- Loop to construct simultaneous register transfers for each of the pipeline stages
 -- LATENCY=0 is combinational Logic
 for STAGE in 0 to PIPELINE_LATENCY loop
   if STAGE = 0 then
     -- Mux in clock enable
     VAR_CLOCK_ENABLE := CLOCK_ENABLE;
     -- Mux in inputs
     VAR_phase := phase;
     VAR_ins := ins;
     VAR_pc := pc;
     VAR_previous_stack_read := previous_stack_read;
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_left := VAR_ins;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_left := VAR_phase;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue := VAR_previous_ram_read;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue := VAR_previous_ram_read;
     VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := t8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue := tmp8;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse := tmp8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1742_c11_6f81] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_left;
     BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output := BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1729_c11_8ee7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1724_l1729_l1732_DUPLICATE_f1d1 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1724_l1729_l1732_DUPLICATE_f1d1_return_output := result.sp_relative_shift;

     -- BIN_OP_AND[uxn_opcodes_h_l1735_c32_0a0b] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_left;
     BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_return_output := BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_return_output;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1740_c26_f419] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_f419_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df_return_output := result.is_stack_write;

     -- CAST_TO_int8_t[uxn_opcodes_h_l1736_c26_2303] LATENCY=0
     VAR_CAST_TO_int8_t_uxn_opcodes_h_l1736_c26_2303_return_output := CAST_TO_int8_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1724_c6_c639] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_left;
     BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output := BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1732_c11_996c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_9196 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_9196_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1742_l1732_DUPLICATE_f04a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1742_l1732_DUPLICATE_f04a_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1748_c11_76f2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1738_c11_d50b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_4871 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_4871_return_output := result.ram_addr;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a_return_output := result.stack_value;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1735_c32_0a0b_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1724_c6_c639_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1729_c11_8ee7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1732_c11_996c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1738_c11_d50b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1742_c11_6f81_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1748_c11_76f2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1736_c26_2303_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_right := VAR_CAST_TO_int8_t_uxn_opcodes_h_l1740_c26_f419_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1724_l1729_l1732_DUPLICATE_f1d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1724_l1729_l1732_DUPLICATE_f1d1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1724_l1729_l1732_DUPLICATE_f1d1_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_4871_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_4871_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_4871_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1748_l1742_DUPLICATE_3670_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_9196_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_9196_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1724_l1738_l1729_DUPLICATE_9196_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1748_DUPLICATE_e2df_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1742_l1732_DUPLICATE_f04a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1742_l1732_DUPLICATE_f04a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1738_l1742_l1732_DUPLICATE_f04a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1738_l1732_l1729_l1724_l1742_DUPLICATE_1c7a_return_output;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1740_c21_612e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1736_c21_5f13] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1742_c7_66d0] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output := result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1748_c7_0990] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_return_output;

     -- t8_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     t8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     t8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := t8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1742_c7_66d0] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_cond;
     tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output := tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1724_c1_61b7] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1748_c7_0990] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1735_c32_d9d2] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_left;
     BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_return_output := BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1742_c7_66d0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1738_c7_bcfc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1735_c32_179d_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1735_c32_d9d2_return_output;
     VAR_result_ram_addr_uxn_opcodes_h_l1736_c3_c019 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1736_c21_5f13_return_output)),16);
     VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_725c := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1740_c21_612e_return_output)),16);
     VAR_printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1724_c1_61b7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1748_c7_0990_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1748_c7_0990_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1736_c3_c019;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue := VAR_result_ram_addr_uxn_opcodes_h_l1740_c3_725c;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1742_c7_66d0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;

     -- printf_uxn_opcodes_h_l1725_c3_0673[uxn_opcodes_h_l1725_c3_0673] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1725_c3_0673_uxn_opcodes_h_l1725_c3_0673_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_ram_addr_MUX[uxn_opcodes_h_l1738_c7_bcfc] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1742_c7_66d0] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;

     -- MUX[uxn_opcodes_h_l1735_c32_179d] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1735_c32_179d_cond <= VAR_MUX_uxn_opcodes_h_l1735_c32_179d_cond;
     MUX_uxn_opcodes_h_l1735_c32_179d_iftrue <= VAR_MUX_uxn_opcodes_h_l1735_c32_179d_iftrue;
     MUX_uxn_opcodes_h_l1735_c32_179d_iffalse <= VAR_MUX_uxn_opcodes_h_l1735_c32_179d_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1735_c32_179d_return_output := MUX_uxn_opcodes_h_l1735_c32_179d_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1738_c7_bcfc] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output := result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1738_c7_bcfc] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond;
     tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output := tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     t8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     t8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := t8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1738_c7_bcfc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue := VAR_MUX_uxn_opcodes_h_l1735_c32_179d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1742_c7_66d0_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;
     -- tmp8_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- t8_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1738_c7_bcfc] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1738_c7_bcfc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- Submodule level 4
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1738_c7_bcfc_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1732_c7_9852] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- Submodule level 5
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1732_c7_9852_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_tmp8_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- tmp8_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1729_c7_1872] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- Submodule level 6
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1729_c7_1872_return_output;
     REG_VAR_tmp8 := VAR_tmp8_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1724_c2_c2b9] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1753_l1720_DUPLICATE_c155 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1753_l1720_DUPLICATE_c155_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_3413(
     result,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1724_c2_c2b9_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1753_l1720_DUPLICATE_c155_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_3413_uxn_opcodes_h_l1753_l1720_DUPLICATE_c155_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_tmp8 <= REG_VAR_tmp8;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     tmp8 <= REG_COMB_tmp8;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
