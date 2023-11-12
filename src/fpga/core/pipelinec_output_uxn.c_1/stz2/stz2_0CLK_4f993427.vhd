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
-- Submodules: 68
entity stz2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_4f993427;
architecture arch of stz2_0CLK_4f993427 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_d564]
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_bfa9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1483_c2_a028]
signal t8_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1483_c2_a028]
signal n16_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_a028]
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_a028]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_a028]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_a028]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_a028]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_a028]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_a028]
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1484_c3_2cf8[uxn_opcodes_h_l1484_c3_2cf8]
signal printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_d3f6]
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1488_c7_7326]
signal t8_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1488_c7_7326]
signal n16_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_7326]
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_7326]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_7326]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_7326]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_7326]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_7326]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_7326]
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_9224]
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal t8_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal n16_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_f19b]
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_d39d]
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1495_c7_9d94]
signal n16_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_9d94]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_9d94]
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_9d94]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_9d94]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_9d94]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_9d94]
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(7 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1497_c3_b76b]
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_30c7]
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1499_c7_c742]
signal n16_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_c742]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_c742]
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_c742]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_c742]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_c742]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_c742]
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(7 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1500_c3_f8ab]
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1502_c30_5a54]
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1505_c31_f7aa]
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_c2ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_00f5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_00f5]
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_00f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_00f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_00f5]
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_39e0]
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_15fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_0353]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_0353]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_8efe( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : signed;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_left,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_right,
BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_return_output);

-- t8_MUX_uxn_opcodes_h_l1483_c2_a028
t8_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
t8_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
t8_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
t8_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- n16_MUX_uxn_opcodes_h_l1483_c2_a028
n16_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
n16_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
n16_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
n16_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

-- printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8
printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8 : entity work.printf_uxn_opcodes_h_l1484_c3_2cf8_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_left,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_right,
BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output);

-- t8_MUX_uxn_opcodes_h_l1488_c7_7326
t8_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
t8_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
t8_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
t8_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- n16_MUX_uxn_opcodes_h_l1488_c7_7326
n16_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
n16_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
n16_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
n16_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_left,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_right,
BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output);

-- t8_MUX_uxn_opcodes_h_l1491_c7_f19b
t8_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
t8_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- n16_MUX_uxn_opcodes_h_l1491_c7_f19b
n16_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
n16_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_left,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_right,
BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output);

-- n16_MUX_uxn_opcodes_h_l1495_c7_9d94
n16_MUX_uxn_opcodes_h_l1495_c7_9d94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1495_c7_9d94_cond,
n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue,
n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse,
n16_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b
CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_x,
CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_left,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_right,
BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output);

-- n16_MUX_uxn_opcodes_h_l1499_c7_c742
n16_MUX_uxn_opcodes_h_l1499_c7_c742 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1499_c7_c742_cond,
n16_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue,
n16_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse,
n16_MUX_uxn_opcodes_h_l1499_c7_c742_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab
BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_left,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_right,
BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54
sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_ins,
sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_x,
sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_y,
sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa
CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_x,
CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_left,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_right,
BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_return_output,
 t8_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 n16_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output,
 t8_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 n16_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output,
 t8_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 n16_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output,
 n16_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output,
 CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output,
 n16_MUX_uxn_opcodes_h_l1499_c7_c742_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output,
 sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_return_output,
 CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_54ad : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_ff06 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_a6fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_f19b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_eec4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_5c36_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_dff4_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_39a8_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1500_l1496_DUPLICATE_f06d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1477_l1517_DUPLICATE_12c7_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_right := to_unsigned(4, 3);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_54ad := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1485_c3_54ad;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_right := to_unsigned(2, 2);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_a6fe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1493_c3_a6fe;
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_ff06 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1489_c3_ff06;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_right := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := t8;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1510_c21_39a8] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_39a8_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1483_c6_d564] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_left;
     BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output := BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1509_c33_39e0] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1495_c11_d39d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1491_c11_9224] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_left;
     BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output := BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1507_c11_c2ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1499_c11_30c7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1504_c22_eec4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_eec4_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- BIN_OP_EQ[uxn_opcodes_h_l1512_c11_15fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_f19b_return_output := result.stack_address_sp_offset;

     -- sp_relative_shift[uxn_opcodes_h_l1502_c30_5a54] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_ins;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_x;
     sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_return_output := sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1500_l1496_DUPLICATE_f06d LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1500_l1496_DUPLICATE_f06d_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1488_c11_d3f6] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_left;
     BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output := BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1483_c6_d564_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1488_c11_d3f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1491_c11_9224_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1495_c11_d39d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1499_c11_30c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1507_c11_c2ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1512_c11_15fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1504_c22_eec4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1500_l1496_DUPLICATE_f06d_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1500_l1496_DUPLICATE_f06d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1510_c21_39a8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1483_l1499_l1495_l1491_l1488_DUPLICATE_2509_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_d1a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1512_l1507_l1499_l1495_l1491_l1488_DUPLICATE_16b1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1483_l1512_l1507_l1495_l1491_l1488_DUPLICATE_6c36_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_bde2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1483_l1507_l1495_l1491_l1488_DUPLICATE_3d0d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1502_c30_5a54_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1507_c7_00f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1507_c7_00f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1509_c22_dff4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_dff4_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1509_c33_39e0_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- t8_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := t8_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1500_c3_f8ab] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_left;
     BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output := BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1497_c3_b76b] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_return_output := CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1512_c7_0353] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1499_c7_c742] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1512_c7_0353] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1483_c1_bfa9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1500_c3_f8ab_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1509_c22_dff4_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1497_c3_b76b_return_output;
     VAR_printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1483_c1_bfa9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1512_c7_0353_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1512_c7_0353_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     -- printf_uxn_opcodes_h_l1484_c3_2cf8[uxn_opcodes_h_l1484_c3_2cf8] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1484_c3_2cf8_uxn_opcodes_h_l1484_c3_2cf8_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1507_c7_00f5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1505_c31_f7aa] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_return_output := CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     t8_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     t8_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := t8_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1507_c7_00f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1499_c7_c742] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1495_c7_9d94] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1507_c7_00f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1499_c7_c742] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1499_c7_c742_cond <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_cond;
     n16_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue;
     n16_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_return_output := n16_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1507_c7_00f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1499_c7_c742] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output := result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1505_c21_5c36] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_5c36_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1505_c31_f7aa_return_output);

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1495_c7_9d94] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;

     -- t8_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     t8_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     t8_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := t8_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- n16_MUX[uxn_opcodes_h_l1495_c7_9d94] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1495_c7_9d94_cond <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_cond;
     n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue;
     n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output := n16_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1499_c7_c742] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1499_c7_c742] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1505_c21_5c36_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := n16_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1499_c7_c742] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output := result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1495_c7_9d94] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1495_c7_9d94] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output := result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1495_c7_9d94] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1499_c7_c742_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     n16_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     n16_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := n16_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1495_c7_9d94] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output := result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1495_c7_9d94_return_output;
     -- n16_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     n16_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     n16_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := n16_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1491_c7_f19b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1491_c7_f19b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1488_c7_7326] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output := result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- Submodule level 8
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1488_c7_7326_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1483_c2_a028] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output := result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1477_l1517_DUPLICATE_12c7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1477_l1517_DUPLICATE_12c7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_8efe(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1483_c2_a028_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1483_c2_a028_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1477_l1517_DUPLICATE_12c7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_8efe_uxn_opcodes_h_l1477_l1517_DUPLICATE_12c7_return_output;
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
