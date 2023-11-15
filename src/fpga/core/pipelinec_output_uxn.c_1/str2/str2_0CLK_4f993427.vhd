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
entity str2_0CLK_4f993427 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_4f993427;
architecture arch of str2_0CLK_4f993427 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1629_c6_a159]
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1629_c1_0b7c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1629_c2_c674]
signal n16_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1629_c2_c674]
signal t8_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1629_c2_c674]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1629_c2_c674]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1629_c2_c674]
signal result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1629_c2_c674]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c2_c674]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c2_c674]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1629_c2_c674]
signal result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1630_c3_5355[uxn_opcodes_h_l1630_c3_5355]
signal printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1634_c11_1d89]
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal n16_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal t8_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1634_c7_dafa]
signal result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_14f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal n16_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal t8_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1637_c7_5bae]
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1641_c11_b45c]
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1641_c7_366f]
signal n16_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c7_366f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1641_c7_366f]
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1641_c7_366f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c7_366f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c7_366f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1641_c7_366f]
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1643_c3_ae9d]
signal CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_407c]
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1645_c7_4656]
signal n16_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(15 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_4656]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_4656]
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_4656]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_4656]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_4656]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_4656]
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1646_c3_838c]
signal BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1648_c30_ef39]
signal sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1651_c31_8be7]
signal CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_6610]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_ed05]
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(7 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_ed05]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_ed05]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_ed05]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_ed05]
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1655_c22_f7d4]
signal BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1658_c11_432b]
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1658_c7_866c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1658_c7_866c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output : signed(17 downto 0);

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

function CAST_TO_int8_t_uint8_t( rhs : unsigned) return signed is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : signed(7 downto 0);

begin

      return_output := signed(std_logic_vector(resize(rhs,8)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_18d1( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : signed;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.stack_address_sp_offset := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.u8_value := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.u16_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_left,
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_right,
BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_return_output);

-- n16_MUX_uxn_opcodes_h_l1629_c2_c674
n16_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
n16_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
n16_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
n16_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- t8_MUX_uxn_opcodes_h_l1629_c2_c674
t8_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
t8_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
t8_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
t8_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674
result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674
result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond,
result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

-- printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355
printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355 : entity work.printf_uxn_opcodes_h_l1630_c3_5355_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_left,
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_right,
BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output);

-- n16_MUX_uxn_opcodes_h_l1634_c7_dafa
n16_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
n16_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- t8_MUX_uxn_opcodes_h_l1634_c7_dafa
t8_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
t8_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa
result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa
result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond,
result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c7_5bae
n16_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- t8_MUX_uxn_opcodes_h_l1637_c7_5bae
t8_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
t8_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae
result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae
result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond,
result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_left,
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_right,
BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output);

-- n16_MUX_uxn_opcodes_h_l1641_c7_366f
n16_MUX_uxn_opcodes_h_l1641_c7_366f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1641_c7_366f_cond,
n16_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue,
n16_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse,
n16_MUX_uxn_opcodes_h_l1641_c7_366f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f
result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f
result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d
CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_x,
CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_left,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_right,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output);

-- n16_MUX_uxn_opcodes_h_l1645_c7_4656
n16_MUX_uxn_opcodes_h_l1645_c7_4656 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1645_c7_4656_cond,
n16_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue,
n16_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse,
n16_MUX_uxn_opcodes_h_l1645_c7_4656_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c
BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_left,
BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_right,
BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39
sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_ins,
sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_x,
sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_y,
sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7
CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_x,
CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4
BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4 : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_left,
BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_right,
BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_left,
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_right,
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 -- Registers
 t8,
 n16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_return_output,
 n16_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 t8_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output,
 n16_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 t8_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 t8_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output,
 n16_MUX_uxn_opcodes_h_l1641_c7_366f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output,
 CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output,
 n16_MUX_uxn_opcodes_h_l1645_c7_4656_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output,
 sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_return_output,
 CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_aa14 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_f3a8 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_b10a : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_c7_5bae_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1650_c3_4b10 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1651_c21_a48e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1655_c3_a887 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1656_c21_de93_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1642_l1646_DUPLICATE_81ee_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_f143_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1624_l1663_DUPLICATE_62bf_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_f3a8 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1635_c3_f3a8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_right := to_unsigned(3, 2);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_b10a := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_b10a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_right := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_right := to_unsigned(4, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_aa14 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1631_c3_aa14;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue := to_unsigned(1, 1);

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

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := t8;
     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1642_l1646_DUPLICATE_81ee LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1642_l1646_DUPLICATE_81ee_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_407c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1634_c11_1d89] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_left;
     BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output := BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_6610] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_f143 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_f143_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1641_c11_b45c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c11_14f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1648_c30_ef39] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_ins;
     sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_x;
     sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_return_output := sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_c7_5bae_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1629_c6_a159] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_left;
     BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output := BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091_return_output := result.is_sp_shift;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1656_c21_de93] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1656_c21_de93_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1658_c11_432b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1629_c6_a159_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1634_c11_1d89_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c11_14f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c11_b45c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_407c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_6610_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_432b_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_f143_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1642_l1646_DUPLICATE_81ee_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1642_l1646_DUPLICATE_81ee_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1656_c21_de93_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1645_l1641_DUPLICATE_775b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_52d8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1637_l1634_l1658_l1653_l1645_l1641_DUPLICATE_5991_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1658_l1653_l1641_DUPLICATE_9493_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3091_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1637_l1634_l1629_l1653_l1641_DUPLICATE_3905_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1648_c30_ef39_return_output;
     -- t8_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := t8_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1629_c1_0b7c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_ed05] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output := result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1646_c3_838c] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_left;
     BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output := BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_ed05] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1658_c7_866c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_4656] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1643_c3_ae9d] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_return_output := CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1658_c7_866c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1646_c3_838c_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1650_c3_4b10 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1650_l1655_DUPLICATE_7c40_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1643_c3_ae9d_return_output;
     VAR_printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1629_c1_0b7c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_866c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_866c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1650_c3_4b10;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_4656] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_ed05] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c7_366f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1645_c7_4656] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1645_c7_4656_cond <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_cond;
     n16_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue;
     n16_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_return_output := n16_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_ed05] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;

     -- t8_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := t8_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- printf_uxn_opcodes_h_l1630_c3_5355[uxn_opcodes_h_l1630_c3_5355] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1630_c3_5355_uxn_opcodes_h_l1630_c3_5355_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1655_c22_f7d4] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1651_c31_8be7] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_return_output := CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1655_c3_a887 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1655_c22_f7d4_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1655_c3_a887;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1651_c21_a48e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1651_c21_a48e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1651_c31_8be7_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_4656] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_4656] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;

     -- t8_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     t8_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     t8_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := t8_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_ed05] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output := result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;

     -- n16_MUX[uxn_opcodes_h_l1641_c7_366f] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1641_c7_366f_cond <= VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_cond;
     n16_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue;
     n16_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_return_output := n16_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c7_366f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1651_c21_a48e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_ed05_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c7_366f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_4656] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output := result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1641_c7_366f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_4656] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output := result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;

     -- n16_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := n16_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_4656_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1641_c7_366f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;

     -- n16_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := n16_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1641_c7_366f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c7_366f_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1637_c7_5bae] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output := result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- n16_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     n16_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     n16_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := n16_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c7_5bae_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1634_c7_dafa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output := result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1634_c7_dafa_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1629_c2_c674] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output := result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1624_l1663_DUPLICATE_62bf LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1624_l1663_DUPLICATE_62bf_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_18d1(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1629_c2_c674_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1629_c2_c674_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1624_l1663_DUPLICATE_62bf_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_18d1_uxn_opcodes_h_l1624_l1663_DUPLICATE_62bf_return_output;
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
