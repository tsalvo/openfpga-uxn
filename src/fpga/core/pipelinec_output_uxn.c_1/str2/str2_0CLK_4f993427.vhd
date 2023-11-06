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
-- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_96a1]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_b0f9]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal t8_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal n16_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_fc55]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1638_c3_6bcb[uxn_opcodes_h_l1638_c3_6bcb]
signal printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_3cd2]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_f2f5]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_777f]
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(3 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_c0dc]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_de0a]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1649_c7_c887]
signal n16_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_c887]
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_c887]
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_c887]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_c887]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_c887]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_c887]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(0 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1651_c3_2d3c]
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_7cf0]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1653_c7_e4f2]
signal n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(15 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_e4f2]
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_e4f2]
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_e4f2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_e4f2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_e4f2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : signed(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_e4f2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(0 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1654_c3_38c2]
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1656_c30_7440]
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1659_c31_8cd6]
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_ea77]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_c99c]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_c99c]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_c99c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_c99c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_c99c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_110d]
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_69c1]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_72f9]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_72f9]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output : signed(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_c878( ref_toks_0 : opcode_result_t;
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
      base.u8_value := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_opc_done := ref_toks_4;
      base.stack_address_sp_offset := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.is_ram_write := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_return_output);

-- t8_MUX_uxn_opcodes_h_l1637_c2_fc55
t8_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
t8_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c2_fc55
n16_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

-- printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb
printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb : entity work.printf_uxn_opcodes_h_l1638_c3_6bcb_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output);

-- t8_MUX_uxn_opcodes_h_l1642_c7_f2f5
t8_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- n16_MUX_uxn_opcodes_h_l1642_c7_f2f5
n16_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_left,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_right,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output);

-- t8_MUX_uxn_opcodes_h_l1645_c7_c0dc
t8_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- n16_MUX_uxn_opcodes_h_l1645_c7_c0dc
n16_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output);

-- n16_MUX_uxn_opcodes_h_l1649_c7_c887
n16_MUX_uxn_opcodes_h_l1649_c7_c887 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1649_c7_c887_cond,
n16_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue,
n16_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse,
n16_MUX_uxn_opcodes_h_l1649_c7_c887_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c
CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_x,
CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output);

-- n16_MUX_uxn_opcodes_h_l1653_c7_e4f2
n16_MUX_uxn_opcodes_h_l1653_c7_e4f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond,
n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue,
n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse,
n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2
BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_left,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_right,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1656_c30_7440
sp_relative_shift_uxn_opcodes_h_l1656_c30_7440 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_ins,
sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_x,
sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_y,
sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6
CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_x,
CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_left,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_right,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_return_output,
 t8_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output,
 t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output,
 t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output,
 n16_MUX_uxn_opcodes_h_l1649_c7_c887_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_return_output,
 CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output,
 n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_return_output,
 CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_2c0b : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_767c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_caba : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_c0dc_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_0764 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_9785_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1663_c3_0238 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_65cf_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_e03b_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_5af2_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1671_l1632_DUPLICATE_844d_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_2c0b := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_2c0b;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_right := to_unsigned(5, 3);
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_y := resize(to_signed(-3, 3), 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_caba := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_caba;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_right := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_767c := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_767c;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_right := to_unsigned(4, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_right := to_unsigned(1, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iffalse := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := t8;
     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58_return_output := result.u16_value;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output := result.is_ram_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_69c1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1664_c21_65cf] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_65cf_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_7cf0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_de0a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_c0dc_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_3cd2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1656_c30_7440] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_ins;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_x;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_return_output := sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_777f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_5af2 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_5af2_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_e03b LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_e03b_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_96a1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_ea77] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_96a1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_3cd2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_777f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_de0a_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_7cf0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_ea77_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_69c1_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_5af2_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_e03b_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_e03b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_65cf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1642_l1637_l1653_l1649_l1645_DUPLICATE_d9d7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_eb58_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1642_l1666_l1661_l1653_l1649_l1645_DUPLICATE_6d48_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1642_l1637_l1666_l1661_l1649_l1645_DUPLICATE_a61d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_dfe7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1642_l1637_l1661_l1649_l1645_DUPLICATE_a9f3_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_7440_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_c99c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- t8_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1654_c3_38c2] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_left;
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output := BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_c99c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_72f9] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_72f9] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_b0f9] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_e4f2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1651_c3_2d3c] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_return_output := CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_38c2_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_0764 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_0fb3_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2d3c_return_output;
     VAR_printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_b0f9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_72f9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_0764;
     -- n16_MUX[uxn_opcodes_h_l1653_c7_e4f2] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond;
     n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue;
     n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output := n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_c99c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_c99c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1659_c31_8cd6] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_return_output := CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- printf_uxn_opcodes_h_l1638_c3_6bcb[uxn_opcodes_h_l1638_c3_6bcb] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1638_c3_6bcb_uxn_opcodes_h_l1638_c3_6bcb_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_110d] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_e4f2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_c887] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;

     -- t8_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1663_c3_0238 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_110d_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1663_c3_0238;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_e4f2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1659_c21_9785] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_9785_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_8cd6_return_output);

     -- n16_MUX[uxn_opcodes_h_l1649_c7_c887] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1649_c7_c887_cond <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_cond;
     n16_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue;
     n16_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_return_output := n16_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_c99c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_e4f2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := t8_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_c887] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_9785_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_c99c_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;
     -- n16_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_e4f2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_c887] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_e4f2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_c887] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_e4f2_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_c887] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output := result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- n16_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_c887] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output := result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_c887_return_output;
     -- n16_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := n16_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_c0dc] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output := result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_c0dc_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_f2f5] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output := result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_f2f5_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_fc55] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output := result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1671_l1632_DUPLICATE_844d LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1671_l1632_DUPLICATE_844d_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_c878(
     result,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_fc55_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1671_l1632_DUPLICATE_844d_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_c878_uxn_opcodes_h_l1671_l1632_DUPLICATE_844d_return_output;
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
