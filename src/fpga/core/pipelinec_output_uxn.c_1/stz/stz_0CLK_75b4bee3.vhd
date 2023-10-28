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
-- Submodules: 56
entity stz_0CLK_75b4bee3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz_0CLK_75b4bee3;
architecture arch of stz_0CLK_75b4bee3 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1608_c6_5030]
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1608_c1_2372]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal t8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1608_c2_ca40]
signal n8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1609_c3_8860[uxn_opcodes_h_l1609_c3_8860]
signal printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1613_c11_808b]
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1613_c7_6cd2]
signal n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1616_c11_0dd0]
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : signed(3 downto 0);

-- t8_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal t8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(7 downto 0);

-- n8_MUX[uxn_opcodes_h_l1616_c7_33a5]
signal n8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_f664]
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_02de]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1620_c7_02de]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1620_c7_02de]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_02de]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1620_c7_02de]
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1620_c7_02de]
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1620_c7_02de]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1620_c7_02de]
signal n8_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_df87]
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1623_c7_78c7]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_78c7]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_78c7]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1623_c7_78c7]
signal result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1623_c7_78c7]
signal result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_78c7]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : signed(3 downto 0);

-- n8_MUX[uxn_opcodes_h_l1623_c7_78c7]
signal n8_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1626_c30_2fd4]
signal sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1631_c11_d07f]
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1631_c7_d302]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1631_c7_d302]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1631_c7_d302]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_5abb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : signed) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.is_ram_write := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.u16_value := ref_toks_5;
      base.u8_value := ref_toks_6;
      base.sp_relative_shift := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030
BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_left,
BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_right,
BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40
result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40
result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- t8_MUX_uxn_opcodes_h_l1608_c2_ca40
t8_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
t8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- n8_MUX_uxn_opcodes_h_l1608_c2_ca40
n8_MUX_uxn_opcodes_h_l1608_c2_ca40 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond,
n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue,
n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse,
n8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

-- printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860
printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860 : entity work.printf_uxn_opcodes_h_l1609_c3_8860_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_left,
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_right,
BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2
result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2
result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2
result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- t8_MUX_uxn_opcodes_h_l1613_c7_6cd2
t8_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- n8_MUX_uxn_opcodes_h_l1613_c7_6cd2
n8_MUX_uxn_opcodes_h_l1613_c7_6cd2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond,
n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue,
n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse,
n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_left,
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_right,
BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5
result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5
result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5
result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- t8_MUX_uxn_opcodes_h_l1616_c7_33a5
t8_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
t8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- n8_MUX_uxn_opcodes_h_l1616_c7_33a5
n8_MUX_uxn_opcodes_h_l1616_c7_33a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond,
n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue,
n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse,
n8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_left,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_right,
BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de
result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de
result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- n8_MUX_uxn_opcodes_h_l1620_c7_02de
n8_MUX_uxn_opcodes_h_l1620_c7_02de : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1620_c7_02de_cond,
n8_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue,
n8_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse,
n8_MUX_uxn_opcodes_h_l1620_c7_02de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_left,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_right,
BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7
result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7
result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond,
result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7
result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond,
result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output);

-- n8_MUX_uxn_opcodes_h_l1623_c7_78c7
n8_MUX_uxn_opcodes_h_l1623_c7_78c7 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1623_c7_78c7_cond,
n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue,
n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse,
n8_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4
sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_ins,
sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_x,
sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_y,
sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_left,
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_right,
BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302
result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 t8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 n8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 t8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 n8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 n8_MUX_uxn_opcodes_h_l1620_c7_02de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output,
 n8_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output,
 sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_9616 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_0bba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_70d8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1621_c3_738c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_c7_02de_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1628_c22_2586_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1637_l1604_DUPLICATE_1efe_return_output : opcode_result_t;
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
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_70d8 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1618_c3_70d8;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iffalse := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_9616 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1610_c3_9616;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_right := to_unsigned(0, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1621_c3_738c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1621_c3_738c;
     VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_0bba := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1614_c3_0bba;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_y := resize(to_signed(-2, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := t8;
     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11_return_output := result.u16_value;

     -- sp_relative_shift[uxn_opcodes_h_l1626_c30_2fd4] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_ins;
     sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_x;
     sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_return_output := sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1631_c11_d07f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1613_c11_808b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1628_c22_2586] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1628_c22_2586_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_c7_02de_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1620_c11_f664] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_left;
     BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output := BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1616_c11_0dd0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1608_c6_5030] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_left;
     BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output := BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1623_c11_df87] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_left;
     BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output := BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062_return_output := result.u8_value;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c6_5030_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1613_c11_808b_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1616_c11_0dd0_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1620_c11_f664_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1623_c11_df87_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1631_c11_d07f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1628_c22_2586_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_90e4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_0e11_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1613_l1631_l1623_l1620_l1616_DUPLICATE_cf17_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_cd78_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1613_l1608_l1631_l1620_l1616_DUPLICATE_6c80_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1613_l1608_l1623_l1620_l1616_DUPLICATE_3062_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1626_c30_2fd4_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1623_c7_78c7] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1623_c7_78c7] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output := result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1623_c7_78c7] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output := result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1631_c7_d302] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1631_c7_d302] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1608_c1_2372] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_return_output;

     -- t8_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := t8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- n8_MUX[uxn_opcodes_h_l1623_c7_78c7] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1623_c7_78c7_cond <= VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_cond;
     n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue;
     n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output := n8_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1631_c7_d302] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1608_c1_2372_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1631_c7_d302_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1631_c7_d302_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1631_c7_d302_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1623_c7_78c7] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- n8_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     n8_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     n8_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := n8_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1623_c7_78c7] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- t8_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1623_c7_78c7] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- printf_uxn_opcodes_h_l1609_c3_8860[uxn_opcodes_h_l1609_c3_8860] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1609_c3_8860_uxn_opcodes_h_l1609_c3_8860_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1623_c7_78c7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     -- t8_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := t8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- n8_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := n8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1620_c7_02de] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1620_c7_02de_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1616_c7_33a5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;

     -- n8_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1616_c7_33a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- n8_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := n8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1613_c7_6cd2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1613_c7_6cd2_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c2_ca40] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1637_l1604_DUPLICATE_1efe LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1637_l1604_DUPLICATE_1efe_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5abb(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c2_ca40_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1637_l1604_DUPLICATE_1efe_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1637_l1604_DUPLICATE_1efe_return_output;
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
