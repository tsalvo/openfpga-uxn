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
-- BIN_OP_EQ[uxn_opcodes_h_l1603_c6_a06d]
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1603_c1_c51d]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1603_c2_d6e4]
signal t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1604_c3_56e7[uxn_opcodes_h_l1604_c3_56e7]
signal printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_32ac]
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal n8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1608_c7_ec86]
signal t8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1611_c11_231c]
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1611_c7_4389]
signal n8_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1611_c7_4389]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1611_c7_4389]
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1611_c7_4389]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1611_c7_4389]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1611_c7_4389]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1611_c7_4389]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1611_c7_4389]
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1611_c7_4389]
signal t8_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1615_c11_425a]
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1615_c7_901f]
signal n8_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c7_901f]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1615_c7_901f]
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(15 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c7_901f]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c7_901f]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c7_901f]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1615_c7_901f]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1615_c7_901f]
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_83fd]
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1618_c7_1ee2]
signal n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_1ee2]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : signed(3 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_1ee2]
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(15 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_1ee2]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_1ee2]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_1ee2]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1618_c7_1ee2]
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(7 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1621_c30_afe0]
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_return_output : signed(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_36ff]
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1626_c7_b515]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1626_c7_b515]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_b515]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_return_output : unsigned(0 downto 0);

function CAST_TO_uint16_t_uint8_t( rhs : unsigned) return unsigned is

  --variable rhs : unsigned(7 downto 0);
  variable return_output : unsigned(15 downto 0);

begin

      return_output := unsigned(std_logic_vector(resize(rhs,16)));
    return return_output;
end function;

function CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7( ref_toks_0 : opcode_result_t;
 ref_toks_1 : signed;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : unsigned;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.sp_relative_shift := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.stack_address_sp_offset := ref_toks_3;
      base.is_sp_shift := ref_toks_4;
      base.is_opc_done := ref_toks_5;
      base.is_ram_write := ref_toks_6;
      base.u8_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_left,
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_right,
BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_return_output);

-- n8_MUX_uxn_opcodes_h_l1603_c2_d6e4
n8_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- t8_MUX_uxn_opcodes_h_l1603_c2_d6e4
t8_MUX_uxn_opcodes_h_l1603_c2_d6e4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond,
t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue,
t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse,
t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

-- printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7
printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7 : entity work.printf_uxn_opcodes_h_l1604_c3_56e7_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_left,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_right,
BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output);

-- n8_MUX_uxn_opcodes_h_l1608_c7_ec86
n8_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
n8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- t8_MUX_uxn_opcodes_h_l1608_c7_ec86
t8_MUX_uxn_opcodes_h_l1608_c7_ec86 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond,
t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue,
t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse,
t8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_left,
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_right,
BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output);

-- n8_MUX_uxn_opcodes_h_l1611_c7_4389
n8_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
n8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
n8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
n8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- t8_MUX_uxn_opcodes_h_l1611_c7_4389
t8_MUX_uxn_opcodes_h_l1611_c7_4389 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1611_c7_4389_cond,
t8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue,
t8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse,
t8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_left,
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_right,
BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output);

-- n8_MUX_uxn_opcodes_h_l1615_c7_901f
n8_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
n8_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
n8_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
n8_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond,
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_left,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_right,
BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output);

-- n8_MUX_uxn_opcodes_h_l1618_c7_1ee2
n8_MUX_uxn_opcodes_h_l1618_c7_1ee2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond,
n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue,
n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse,
n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0
sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_ins,
sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_x,
sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_y,
sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_left,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_right,
BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_return_output,
 n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output,
 n8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 t8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output,
 n8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 t8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output,
 n8_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output,
 n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output,
 sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1605_c3_73fa : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1609_c3_6760 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1613_c3_810c : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_b4a5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1615_c7_901f_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond : unsigned(0 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1623_c22_2c1d_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1599_l1632_DUPLICATE_5db7_return_output : opcode_result_t;
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
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_b4a5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1616_c3_b4a5;
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_x := signed(std_logic_vector(resize(to_unsigned(2, 2), 4)));
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := to_unsigned(0, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue := to_unsigned(1, 1);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_y := resize(to_signed(-2, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iffalse := to_unsigned(0, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1613_c3_810c := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1613_c3_810c;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1605_c3_73fa := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1605_c3_73fa;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1609_c3_6760 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1609_c3_6760;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_right := to_unsigned(5, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_ins := VAR_ins;
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue := VAR_previous_stack_read;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1608_c11_32ac] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_left;
     BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output := BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd_return_output := result.is_opc_done;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1615_c11_425a] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_left;
     BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output := BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1623_c22_2c1d] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1623_c22_2c1d_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95_return_output := result.u8_value;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a_return_output := result.sp_relative_shift;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1603_c6_a06d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_left;
     BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output := BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1615_c7_901f_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1611_c11_231c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_left;
     BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output := BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34_return_output := result.is_ram_write;

     -- sp_relative_shift[uxn_opcodes_h_l1621_c30_afe0] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_ins;
     sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_x;
     sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_return_output := sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1618_c11_83fd] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_left;
     BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output := BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1626_c11_36ff] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_left;
     BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output := BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1603_c6_a06d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1608_c11_32ac_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1611_c11_231c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1615_c11_425a_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1618_c11_83fd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1626_c11_36ff_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1623_c22_2c1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_b67a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_62a5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1611_l1608_l1626_l1618_l1615_DUPLICATE_85cd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_3c34_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1626_l1615_DUPLICATE_6705_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1611_l1608_l1603_l1618_l1615_DUPLICATE_7e95_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1621_c30_afe0_return_output;
     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1603_c1_c51d] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1618_c7_1ee2] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;

     -- t8_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     t8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     t8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := t8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1626_c7_b515] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1626_c7_b515] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_return_output;

     -- n8_MUX[uxn_opcodes_h_l1618_c7_1ee2] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond;
     n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue;
     n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output := n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1618_c7_1ee2] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output := result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1618_c7_1ee2] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output := result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1626_c7_b515] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_return_output;

     -- Submodule level 2
     VAR_printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1603_c1_c51d_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1626_c7_b515_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1626_c7_b515_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1626_c7_b515_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- t8_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := t8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1618_c7_1ee2] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1618_c7_1ee2] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1618_c7_1ee2] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- printf_uxn_opcodes_h_l1604_c3_56e7[uxn_opcodes_h_l1604_c3_56e7] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1604_c3_56e7_uxn_opcodes_h_l1604_c3_56e7_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- n8_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     n8_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     n8_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := n8_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- Submodule level 3
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1618_c7_1ee2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- t8_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- n8_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     n8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     n8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := n8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1615_c7_901f] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1615_c7_901f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;
     -- n8_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := n8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1611_c7_4389] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1611_c7_4389_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1608_c7_ec86] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;

     -- n8_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1608_c7_ec86_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1603_c2_d6e4] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output;

     -- Submodule level 7
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1599_l1632_DUPLICATE_5db7 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1599_l1632_DUPLICATE_5db7_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7(
     result,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1603_c2_d6e4_return_output);

     -- Submodule level 8
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1599_l1632_DUPLICATE_5db7_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_0ba7_uxn_opcodes_h_l1599_l1632_DUPLICATE_5db7_return_output;
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
