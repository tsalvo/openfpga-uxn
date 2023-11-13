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
-- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_68ef]
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_c89a]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1637_c2_6166]
signal t8_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_6166]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_6166]
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_6166]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_6166]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_6166]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_6166]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_6166]
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1637_c2_6166]
signal n16_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l1638_c3_85fc[uxn_opcodes_h_l1638_c3_85fc]
signal printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_e304]
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1642_c7_5b9c]
signal n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_92e1]
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output : unsigned(0 downto 0);

-- t8_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal t8_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1645_c7_b80b]
signal n16_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_2c29]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_4a61]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_4a61]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_4a61]
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_4a61]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_4a61]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_4a61]
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1649_c7_4a61]
signal n16_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1651_c3_2b78]
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_805f]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_1733]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_1733]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_1733]
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_1733]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_1733]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : signed(3 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_1733]
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l1653_c7_1733]
signal n16_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1654_c3_a4c5]
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1656_c30_ea1f]
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1659_c31_2754]
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_fe83]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_e59b]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_e59b]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_e59b]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(15 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_e59b]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_e59b]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_996f]
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_left : signed(17 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_right : signed(1 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_return_output : signed(18 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_aa6f]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_801f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_801f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_return_output : unsigned(0 downto 0);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_left : signed(16 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_right : signed(7 downto 0);
signal BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output : signed(17 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_69e5( ref_toks_0 : opcode_result_t;
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
      base.is_sp_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.stack_address_sp_offset := ref_toks_4;
      base.is_ram_write := ref_toks_5;
      base.sp_relative_shift := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_left,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_right,
BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_return_output);

-- t8_MUX_uxn_opcodes_h_l1637_c2_6166
t8_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
t8_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
t8_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
t8_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- n16_MUX_uxn_opcodes_h_l1637_c2_6166
n16_MUX_uxn_opcodes_h_l1637_c2_6166 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1637_c2_6166_cond,
n16_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue,
n16_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse,
n16_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

-- printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc
printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc : entity work.printf_uxn_opcodes_h_l1638_c3_85fc_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_left,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_right,
BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output);

-- t8_MUX_uxn_opcodes_h_l1642_c7_5b9c
t8_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- n16_MUX_uxn_opcodes_h_l1642_c7_5b9c
n16_MUX_uxn_opcodes_h_l1642_c7_5b9c : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond,
n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue,
n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse,
n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_left,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_right,
BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output);

-- t8_MUX_uxn_opcodes_h_l1645_c7_b80b
t8_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
t8_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- n16_MUX_uxn_opcodes_h_l1645_c7_b80b
n16_MUX_uxn_opcodes_h_l1645_c7_b80b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1645_c7_b80b_cond,
n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue,
n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse,
n16_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output);

-- n16_MUX_uxn_opcodes_h_l1649_c7_4a61
n16_MUX_uxn_opcodes_h_l1649_c7_4a61 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1649_c7_4a61_cond,
n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue,
n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse,
n16_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78
CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_x,
CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output);

-- n16_MUX_uxn_opcodes_h_l1653_c7_1733
n16_MUX_uxn_opcodes_h_l1653_c7_1733 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1653_c7_1733_cond,
n16_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue,
n16_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse,
n16_MUX_uxn_opcodes_h_l1653_c7_1733_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5
BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_left,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_right,
BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f
sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_ins,
sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_x,
sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_y,
sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1659_c31_2754
CONST_SR_8_uxn_opcodes_h_l1659_c31_2754 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_x,
CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f : entity work.BIN_OP_PLUS_int18_t_int2_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_left,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_right,
BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_return_output);

-- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63 : entity work.BIN_OP_PLUS_int17_t_int8_t_0CLK_de264c78 port map (
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_left,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_right,
BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_return_output,
 t8_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 n16_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output,
 t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output,
 t8_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 n16_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output,
 n16_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output,
 CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output,
 n16_MUX_uxn_opcodes_h_l1653_c7_1733_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output,
 sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_return_output,
 CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_return_output,
 BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iffalse : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_da94 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_92cd : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_82a6 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_b80b_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1658_c3_7c29 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_return_output : signed(3 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_b8b1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_uxn_opcodes_h_l1663_c3_5794 : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_left : signed(17 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_right : signed(1 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_return_output : signed(18 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_632d_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_46eb_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_ccc8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_left : signed(16 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_right : signed(7 downto 0);
 variable VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output : signed(17 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1671_l1632_DUPLICATE_c01c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_82a6 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_82a6;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_92cd := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_92cd;
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_right := to_unsigned(3, 2);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_da94 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1639_c3_da94;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_right := signed(std_logic_vector(resize(to_unsigned(1, 1), 2)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_right := to_unsigned(4, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_right := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_y := resize(to_signed(-3, 3), 4);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse := n16;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_left := signed(std_logic_vector(resize(VAR_pc, 17)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_fe83] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_2c29] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;

     -- CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_ccc8 LATENCY=0
     VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_ccc8_return_output := CAST_TO_int8_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1642_c11_e304] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_left;
     BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output := BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_805f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_aa6f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1664_c21_632d] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_632d_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_b80b_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1645_c11_92e1] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_left;
     BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output := BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1656_c30_ea1f] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_ins;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_x;
     sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_return_output := sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_46eb LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_46eb_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1637_c6_68ef] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_left;
     BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output := BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1637_c6_68ef_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1642_c11_e304_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1645_c11_92e1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_2c29_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_805f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_fe83_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_aa6f_return_output;
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_right := VAR_CAST_TO_int8_t_uint8_t_uxn_opcodes_h_l1663_l1658_DUPLICATE_ccc8_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_46eb_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1654_l1650_DUPLICATE_46eb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1664_c21_632d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1653_l1649_l1645_l1642_l1637_DUPLICATE_fa03_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_d74f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1666_l1661_l1653_l1649_l1645_l1642_DUPLICATE_7c8a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1666_l1661_l1649_l1645_l1642_l1637_DUPLICATE_53cc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_ff37_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1649_l1645_l1642_l1637_DUPLICATE_6905_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1656_c30_ea1f_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_801f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1637_c1_c89a] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_1733] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_e59b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1654_c3_a4c5] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_left;
     BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output := BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_e59b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;

     -- BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63 LATENCY=0
     -- Inputs
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_left <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_left;
     BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_right <= VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_right;
     -- Outputs
     VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output := BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output;

     -- t8_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := t8_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_801f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1651_c3_2b78] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_return_output := CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1654_c3_a4c5_return_output;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_left := VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output;
     VAR_result_u16_value_uxn_opcodes_h_l1658_c3_7c29 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_int17_t_int8_t_uxn_opcodes_h_l1658_l1663_DUPLICATE_dd63_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1651_c3_2b78_return_output;
     VAR_printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1637_c1_c89a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_801f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_801f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1658_c3_7c29;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_4a61] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;

     -- printf_uxn_opcodes_h_l1638_c3_85fc[uxn_opcodes_h_l1638_c3_85fc] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1638_c3_85fc_uxn_opcodes_h_l1638_c3_85fc_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- t8_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_e59b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1653_c7_1733] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1653_c7_1733_cond <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_cond;
     n16_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue;
     n16_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_return_output := n16_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1659_c31_2754] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_return_output := CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_e59b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1663_c22_996f] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_1733] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;

     -- Submodule level 3
     VAR_result_u16_value_uxn_opcodes_h_l1663_c3_5794 := resize(unsigned(std_logic_vector(VAR_BIN_OP_PLUS_uxn_opcodes_h_l1663_c22_996f_return_output)),16);
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue := VAR_result_u16_value_uxn_opcodes_h_l1663_c3_5794;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_4a61] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;

     -- n16_MUX[uxn_opcodes_h_l1649_c7_4a61] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1649_c7_4a61_cond <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_cond;
     n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue;
     n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output := n16_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_1733] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1659_c21_b8b1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_b8b1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1659_c31_2754_return_output);

     -- t8_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     t8_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     t8_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := t8_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_e59b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_1733] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1659_c21_b8b1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_e59b_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;
     -- n16_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := n16_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_1733] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output := result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_1733] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output := result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_4a61] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_4a61] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_1733_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_4a61] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output := result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- n16_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_4a61] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output := result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_4a61_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- n16_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     n16_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     n16_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := n16_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1645_c7_b80b] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output := result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;

     -- Submodule level 7
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1645_c7_b80b_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1642_c7_5b9c] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output := result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- Submodule level 8
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1642_c7_5b9c_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1637_c2_6166] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output := result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output;

     -- Submodule level 9
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1671_l1632_DUPLICATE_c01c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1671_l1632_DUPLICATE_c01c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_69e5(
     result,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1637_c2_6166_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1637_c2_6166_return_output);

     -- Submodule level 10
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1671_l1632_DUPLICATE_c01c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_69e5_uxn_opcodes_h_l1671_l1632_DUPLICATE_c01c_return_output;
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
