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
-- Submodules: 61
entity str2_0CLK_a1f536f9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end str2_0CLK_a1f536f9;
architecture arch of str2_0CLK_a1f536f9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1691_c6_f20d]
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1691_c2_3054]
signal n16_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1691_c2_3054]
signal result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1691_c2_3054]
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1691_c2_3054]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c2_3054]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c2_3054]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1691_c2_3054]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1691_c2_3054]
signal t8_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_0033]
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal n16_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1698_c7_91a6]
signal t8_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_891a]
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1701_c7_594e]
signal n16_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_594e]
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_594e]
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_594e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : signed(3 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_594e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1701_c7_594e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_594e]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1701_c7_594e]
signal t8_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1705_c11_e629]
signal BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1705_c7_cde8]
signal n16_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1705_c7_cde8]
signal result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1705_c7_cde8]
signal result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1705_c7_cde8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1705_c7_cde8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1705_c7_cde8]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1707_c3_79de]
signal CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1709_c11_fda4]
signal BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1709_c7_1556]
signal n16_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1709_c7_1556]
signal result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1709_c7_1556]
signal result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1709_c7_1556]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1709_c7_1556]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1709_c7_1556]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1710_c3_1096]
signal BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1712_c30_7a9d]
signal sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1715_c31_7d40]
signal CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_e897]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1717_c7_82a5]
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1717_c7_82a5]
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_82a5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_82a5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c7_82a5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1719_c22_f51e]
signal BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1722_c11_ee2b]
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c7_30e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1722_c7_30e4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output : signed(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : signed;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u16_value := ref_toks_1;
      base.u8_value := ref_toks_2;
      base.sp_relative_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.is_ram_write := ref_toks_6;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d
BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_left,
BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_right,
BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output);

-- n16_MUX_uxn_opcodes_h_l1691_c2_3054
n16_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
n16_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
n16_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
n16_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054
result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054
result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- t8_MUX_uxn_opcodes_h_l1691_c2_3054
t8_MUX_uxn_opcodes_h_l1691_c2_3054 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1691_c2_3054_cond,
t8_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue,
t8_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse,
t8_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_left,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_right,
BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output);

-- n16_MUX_uxn_opcodes_h_l1698_c7_91a6
n16_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
n16_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- t8_MUX_uxn_opcodes_h_l1698_c7_91a6
t8_MUX_uxn_opcodes_h_l1698_c7_91a6 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1698_c7_91a6_cond,
t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue,
t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse,
t8_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_left,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_right,
BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output);

-- n16_MUX_uxn_opcodes_h_l1701_c7_594e
n16_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
n16_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
n16_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
n16_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- t8_MUX_uxn_opcodes_h_l1701_c7_594e
t8_MUX_uxn_opcodes_h_l1701_c7_594e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1701_c7_594e_cond,
t8_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue,
t8_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse,
t8_MUX_uxn_opcodes_h_l1701_c7_594e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_left,
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_right,
BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output);

-- n16_MUX_uxn_opcodes_h_l1705_c7_cde8
n16_MUX_uxn_opcodes_h_l1705_c7_cde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1705_c7_cde8_cond,
n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue,
n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse,
n16_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8
result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond,
result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8
result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond,
result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8
result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1707_c3_79de
CONST_SL_8_uxn_opcodes_h_l1707_c3_79de : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_x,
CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_left,
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_right,
BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output);

-- n16_MUX_uxn_opcodes_h_l1709_c7_1556
n16_MUX_uxn_opcodes_h_l1709_c7_1556 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1709_c7_1556_cond,
n16_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue,
n16_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse,
n16_MUX_uxn_opcodes_h_l1709_c7_1556_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556
result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond,
result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556
result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond,
result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556
result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096
BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_left,
BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_right,
BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d
sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_ins,
sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_x,
sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_y,
sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40
CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_x,
CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5
result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5
result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e
BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_left,
BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_right,
BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_left,
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_right,
BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output,
 n16_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 t8_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output,
 n16_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 t8_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output,
 n16_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 t8_MUX_uxn_opcodes_h_l1701_c7_594e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output,
 n16_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output,
 CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output,
 n16_MUX_uxn_opcodes_h_l1709_c7_1556_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output,
 sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_return_output,
 CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1695_c3_3133 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1699_c3_b1d6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_8639 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1701_c7_594e_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1714_c3_0995 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1715_c21_995d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1719_c3_08b6 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_uxn_opcodes_h_l1718_c3_262a : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1720_c21_d67b_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1706_l1710_DUPLICATE_4776_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_5457_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1727_l1686_DUPLICATE_72fc_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_right := to_unsigned(2, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue := to_unsigned(1, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_right := to_unsigned(6, 3);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1695_c3_3133 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1695_c3_3133;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_8639 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1703_c3_8639;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_right := to_unsigned(4, 3);
     VAR_result_sp_relative_shift_uxn_opcodes_h_l1718_c3_262a := signed(std_logic_vector(resize(to_unsigned(0, 1), 4)));
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue := VAR_result_sp_relative_shift_uxn_opcodes_h_l1718_c3_262a;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_right := to_unsigned(5, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_right := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1699_c3_b1d6 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1699_c3_b1d6;

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
     VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := t8;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1720_c21_d67b] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1720_c21_d67b_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1705_c11_e629] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_left;
     BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output := BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1722_c11_ee2b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1709_c11_fda4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902_return_output := result.sp_relative_shift;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_5457 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_5457_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83_return_output := result.u8_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c11_e897] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1701_c7_594e_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output := result.is_ram_write;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1706_l1710_DUPLICATE_4776 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1706_l1710_DUPLICATE_4776_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1698_c11_0033] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_left;
     BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output := BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1712_c30_7a9d] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_ins;
     sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_x;
     sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_return_output := sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1691_c6_f20d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1701_c11_891a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;

     -- Submodule level 1
     VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1691_c6_f20d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1698_c11_0033_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1701_c11_891a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1705_c11_e629_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1709_c11_fda4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c11_e897_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1722_c11_ee2b_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_5457_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1706_l1710_DUPLICATE_4776_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1706_l1710_DUPLICATE_4776_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1720_c21_d67b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_b902_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_2438_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1698_l1722_l1717_l1709_l1705_l1701_DUPLICATE_2c89_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1698_l1691_l1722_l1717_l1705_l1701_DUPLICATE_f71e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1698_l1691_l1717_l1705_l1701_DUPLICATE_eb83_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1712_c30_7a9d_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1710_c3_1096] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_left;
     BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output := BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output;

     -- t8_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     t8_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     t8_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := t8_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1707_c3_79de] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_return_output := CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1722_c7_30e4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1722_c7_30e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1717_c7_82a5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c7_82a5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1710_c3_1096_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1714_c3_0995 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1719_l1714_DUPLICATE_b875_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1707_c3_79de_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1722_c7_30e4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1714_c3_0995;
     -- CONST_SR_8[uxn_opcodes_h_l1715_c31_7d40] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_return_output := CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1719_c22_f51e] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1709_c7_1556] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;

     -- t8_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := t8_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1717_c7_82a5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c7_82a5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1709_c7_1556] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1709_c7_1556_cond <= VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_cond;
     n16_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue;
     n16_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_return_output := n16_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1719_c3_08b6 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1719_c22_f51e_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1719_c3_08b6;
     -- result_u16_value_MUX[uxn_opcodes_h_l1717_c7_82a5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- t8_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     t8_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     t8_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := t8_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1715_c21_995d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1715_c21_995d_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1715_c31_7d40_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1709_c7_1556] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1705_c7_cde8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1709_c7_1556] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;

     -- n16_MUX[uxn_opcodes_h_l1705_c7_cde8] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1705_c7_cde8_cond <= VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_cond;
     n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue;
     n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output := n16_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1715_c21_995d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1717_c7_82a5_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1705_c7_cde8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1705_c7_cde8] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     n16_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     n16_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := n16_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1709_c7_1556] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output := result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1709_c7_1556] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output := result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1709_c7_1556_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1705_c7_cde8] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output := result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1705_c7_cde8] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output := result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;

     -- n16_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := n16_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1705_c7_cde8_return_output;
     -- n16_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     n16_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     n16_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := n16_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1701_c7_594e] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output := result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1701_c7_594e_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1698_c7_91a6] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output := result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1698_c7_91a6_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1691_c2_3054] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output := result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1727_l1686_DUPLICATE_72fc LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1727_l1686_DUPLICATE_72fc_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1691_c2_3054_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1691_c2_3054_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1727_l1686_DUPLICATE_72fc_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_7ccb_uxn_opcodes_h_l1727_l1686_DUPLICATE_72fc_return_output;
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
