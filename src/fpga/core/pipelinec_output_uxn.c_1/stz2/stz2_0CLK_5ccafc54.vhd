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
-- Submodules: 96
entity stz2_0CLK_5ccafc54 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_5ccafc54;
architecture arch of stz2_0CLK_5ccafc54 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t8 : unsigned(7 downto 0) := to_unsigned(0, 8);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t8 : unsigned(7 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l1744_c6_99d8]
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1744_c1_7fea]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal n16_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1744_c2_36a9]
signal t8_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1745_c3_4b81[uxn_opcodes_h_l1745_c3_4b81]
signal printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1750_c11_dfd3]
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal n16_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1750_c7_d07f]
signal t8_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_e0b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1753_c7_5a5e]
signal t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1757_c11_4f9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal n16_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c7_bb61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_84fb]
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal n16_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_1a58]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1762_c3_9b2e]
signal CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1765_c11_b730]
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1765_c7_2897]
signal n16_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(7 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : signed(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c7_2897]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1768_c11_7110]
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal n16_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(15 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : signed(7 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1768_c7_99a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1769_c3_936d]
signal BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1772_c32_de41]
signal BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1772_c32_e8b7]
signal BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1772_c32_5adb]
signal MUX_uxn_opcodes_h_l1772_c32_5adb_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1772_c32_5adb_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1772_c32_5adb_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1772_c32_5adb_return_output : signed(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1775_c32_04ad]
signal CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_6962]
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output : unsigned(0 downto 0);

-- result_ram_addr_MUX[uxn_opcodes_h_l1777_c7_ca0f]
signal result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(15 downto 0);
signal result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_ca0f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(0 downto 0);

-- result_ram_value_MUX[uxn_opcodes_h_l1777_c7_ca0f]
signal result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(7 downto 0);
signal result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c7_ca0f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_ca0f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1779_c32_3522]
signal BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_c456]
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_f7ae]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_f7ae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CAST_TO_uint8_t_uint16_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(15 downto 0);
  variable return_output : unsigned(7 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CAST_TO_uint16_t_uint9_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(8 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_475e( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned;
 ref_toks_8 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.is_stack_read := ref_toks_1;
      base.ram_value := ref_toks_2;
      base.ram_addr := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.is_ram_write := ref_toks_7;
      base.is_opc_done := ref_toks_8;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8
BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_left,
BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_right,
BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_return_output);

-- n16_MUX_uxn_opcodes_h_l1744_c2_36a9
n16_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
n16_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9
result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9
result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9
result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- t8_MUX_uxn_opcodes_h_l1744_c2_36a9
t8_MUX_uxn_opcodes_h_l1744_c2_36a9 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1744_c2_36a9_cond,
t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue,
t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse,
t8_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

-- printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81
printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81 : entity work.printf_uxn_opcodes_h_l1745_c3_4b81_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_left,
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_right,
BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output);

-- n16_MUX_uxn_opcodes_h_l1750_c7_d07f
n16_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
n16_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f
result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f
result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f
result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- t8_MUX_uxn_opcodes_h_l1750_c7_d07f
t8_MUX_uxn_opcodes_h_l1750_c7_d07f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1750_c7_d07f_cond,
t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue,
t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse,
t8_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output);

-- n16_MUX_uxn_opcodes_h_l1753_c7_5a5e
n16_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- t8_MUX_uxn_opcodes_h_l1753_c7_5a5e
t8_MUX_uxn_opcodes_h_l1753_c7_5a5e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond,
t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue,
t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse,
t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output);

-- n16_MUX_uxn_opcodes_h_l1757_c7_bb61
n16_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
n16_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61
result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61
result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61
result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_left,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_right,
BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output);

-- n16_MUX_uxn_opcodes_h_l1760_c7_1a58
n16_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
n16_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e
CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_x,
CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_left,
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_right,
BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output);

-- n16_MUX_uxn_opcodes_h_l1765_c7_2897
n16_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
n16_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
n16_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
n16_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897
result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897
result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897
result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897
result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_left,
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_right,
BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output);

-- n16_MUX_uxn_opcodes_h_l1768_c7_99a3
n16_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
n16_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d
BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_left,
BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_right,
BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41
BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_left,
BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_right,
BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7
BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_left,
BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_right,
BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_return_output);

-- MUX_uxn_opcodes_h_l1772_c32_5adb
MUX_uxn_opcodes_h_l1772_c32_5adb : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1772_c32_5adb_cond,
MUX_uxn_opcodes_h_l1772_c32_5adb_iftrue,
MUX_uxn_opcodes_h_l1772_c32_5adb_iffalse,
MUX_uxn_opcodes_h_l1772_c32_5adb_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad
CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_x,
CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_left,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_right,
BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output);

-- result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f
result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond,
result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue,
result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse,
result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output);

-- result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f
result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond,
result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue,
result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse,
result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522
BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_left,
BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_right,
BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_left,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_right,
BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_return_output,
 n16_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 t8_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output,
 n16_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 t8_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output,
 n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output,
 n16_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output,
 n16_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output,
 CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output,
 n16_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output,
 n16_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_return_output,
 MUX_uxn_opcodes_h_l1772_c32_5adb_return_output,
 CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output,
 result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output,
 result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1747_c3_0c68 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1751_c3_d655 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_a750 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_b526 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1763_c3_ced4 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1766_c3_160d : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1765_c7_2897_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_return_output : signed(7 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1774_c21_1494_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1775_c22_ede3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output : unsigned(0 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(15 downto 0);
 variable VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(7 downto 0);
 variable VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1779_c21_9ae1_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1780_c22_ad4e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1761_l1769_DUPLICATE_ee12_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1787_l1738_DUPLICATE_4c9d_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t8 : unsigned(7 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t8 := t8;
  REG_VAR_n16 := n16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_right := to_unsigned(128, 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_right := to_unsigned(6, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1751_c3_d655 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1751_c3_d655;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1747_c3_0c68 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1747_c3_0c68;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_right := to_unsigned(8, 4);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_right := to_unsigned(7, 3);
     VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_iffalse := resize(to_signed(-3, 3), 8);
     VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_iftrue := signed(std_logic_vector(resize(to_unsigned(0, 1), 8)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_b526 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1758_c3_b526;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1766_c3_160d := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1766_c3_160d;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_a750 := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1755_c3_a750;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1763_c3_ced4 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1763_c3_ced4;

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := t8;
     -- BIN_OP_PLUS[uxn_opcodes_h_l1779_c32_3522] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1774_c21_1494] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1774_c21_1494_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1765_c11_b730] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_left;
     BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output := BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output := result.is_opc_done;

     -- BIN_OP_AND[uxn_opcodes_h_l1772_c32_de41] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_left;
     BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_return_output := BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1780_c22_ad4e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1780_c22_ad4e_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1782_c11_c456] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_left;
     BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output := BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1765_c7_2897_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1753_c11_e0b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1761_l1769_DUPLICATE_ee12 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1761_l1769_DUPLICATE_ee12_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1768_c11_7110] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_left;
     BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output := BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1750_c11_dfd3] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_left;
     BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output := BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output := result.ram_addr;

     -- BIN_OP_EQ[uxn_opcodes_h_l1744_c6_99d8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output := result.ram_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1760_c11_84fb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l1777_c11_6962] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_left;
     BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output := BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1757_c11_4f9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1772_c32_de41_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1744_c6_99d8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1750_c11_dfd3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1753_c11_e0b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1757_c11_4f9b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1760_c11_84fb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1765_c11_b730_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1768_c11_7110_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1777_c11_6962_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1782_c11_c456_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1774_c21_1494_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1761_l1769_DUPLICATE_ee12_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1761_l1769_DUPLICATE_ee12_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1780_c22_ad4e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1753_l1750_l1744_l1768_l1765_l1760_l1757_DUPLICATE_f4c8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_ram_addr_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_f0a8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1768_l1765_l1760_l1757_DUPLICATE_7f6b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1753_l1782_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_76a0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_4072_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1753_l1750_l1768_l1765_l1760_l1757_DUPLICATE_cf02_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_ram_value_d41d_uxn_opcodes_h_l1753_l1750_l1777_l1744_l1765_l1760_l1757_DUPLICATE_1d0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1765_c7_2897_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1762_c3_9b2e] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_return_output := CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1769_c3_936d] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_left;
     BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output := BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l1772_c32_e8b7] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_left;
     BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_return_output := BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1777_c7_ca0f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1779_c21_9ae1] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1779_c21_9ae1_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1779_c32_3522_return_output);

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1744_c1_7fea] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1777_c7_ca0f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1782_c7_f7ae] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1782_c7_f7ae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1772_c32_e8b7_return_output;
     VAR_CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1769_c3_936d_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1779_c21_9ae1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1762_c3_9b2e_return_output;
     VAR_printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1744_c1_7fea_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1782_c7_f7ae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     -- MUX[uxn_opcodes_h_l1772_c32_5adb] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1772_c32_5adb_cond <= VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_cond;
     MUX_uxn_opcodes_h_l1772_c32_5adb_iftrue <= VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_iftrue;
     MUX_uxn_opcodes_h_l1772_c32_5adb_iffalse <= VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_return_output := MUX_uxn_opcodes_h_l1772_c32_5adb_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1777_c7_ca0f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- t8_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := t8_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- printf_uxn_opcodes_h_l1745_c3_4b81[uxn_opcodes_h_l1745_c3_4b81] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1745_c3_4b81_uxn_opcodes_h_l1745_c3_4b81_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n16_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := n16_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1775_c32_04ad] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_return_output := CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1777_c7_ca0f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1777_c7_ca0f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := VAR_MUX_uxn_opcodes_h_l1772_c32_5adb_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1777_c7_ca0f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- t8_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := t8_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- n16_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     n16_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     n16_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := n16_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1775_c22_ede3] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1775_c22_ede3_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1775_c32_04ad_return_output);

     -- Submodule level 4
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1775_c22_ede3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- n16_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := n16_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1768_c7_99a3] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output := result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1768_c7_99a3_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1765_c7_2897] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_return_output := result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- n16_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := n16_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1765_c7_2897_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- n16_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1760_c7_1a58] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output := result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1760_c7_1a58_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := n16_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1757_c7_bb61] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output := result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1757_c7_bb61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     -- result_ram_addr_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1753_c7_5a5e] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output := result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;

     -- n16_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := n16_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_ram_addr_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1753_c7_5a5e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_ram_value_MUX[uxn_opcodes_h_l1750_c7_d07f] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output := result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;

     -- result_ram_addr_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- Submodule level 10
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse := VAR_result_ram_value_MUX_uxn_opcodes_h_l1750_c7_d07f_return_output;
     -- result_ram_value_MUX[uxn_opcodes_h_l1744_c2_36a9] LATENCY=0
     -- Inputs
     result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_cond <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_cond;
     result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iftrue;
     result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse <= VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_iffalse;
     -- Outputs
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output := result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1787_l1738_DUPLICATE_4c9d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1787_l1738_DUPLICATE_4c9d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_475e(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
     VAR_result_ram_value_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
     VAR_result_ram_addr_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1744_c2_36a9_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1787_l1738_DUPLICATE_4c9d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_475e_uxn_opcodes_h_l1787_l1738_DUPLICATE_4c9d_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t8 <= REG_VAR_t8;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t8 <= REG_COMB_t8;
     n16 <= REG_COMB_n16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
