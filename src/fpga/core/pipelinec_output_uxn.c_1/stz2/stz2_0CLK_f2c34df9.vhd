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
-- Submodules: 87
entity stz2_0CLK_f2c34df9 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end stz2_0CLK_f2c34df9;
architecture arch of stz2_0CLK_f2c34df9 is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1646_c6_723b]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1646_c1_e065]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c2_e061]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c2_e061]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c2_e061]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c2_e061]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1646_c2_e061]
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1646_c2_e061]
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c2_e061]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1646_c2_e061]
signal n16_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1646_c2_e061]
signal t8_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(7 downto 0);

-- printf_uxn_opcodes_h_l1647_c3_c04b[uxn_opcodes_h_l1647_c3_c04b]
signal printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_b523]
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal n16_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1651_c7_4e14]
signal t8_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_21d0]
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_6840]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1654_c7_6840]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c7_6840]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_6840]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_6840]
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_6840]
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_6840]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1654_c7_6840]
signal n16_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1654_c7_6840]
signal t8_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1658_c11_0d5b]
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1658_c7_a0ec]
signal n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_90f7]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c7_0954]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_0954]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_0954]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_0954]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_0954]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_0954]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c7_0954]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1661_c7_0954]
signal n16_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(15 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1663_c3_21ae]
signal CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_25a9]
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(3 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1666_c7_aeaa]
signal n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_f253]
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1669_c7_adcd]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1669_c7_adcd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_adcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1669_c7_adcd]
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_adcd]
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(7 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1669_c7_adcd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : signed(3 downto 0);

-- n16_MUX[uxn_opcodes_h_l1669_c7_adcd]
signal n16_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1670_c3_8044]
signal BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1672_c30_d8d7]
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1675_c31_ed2b]
signal CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_d7e5]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_a2ea]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1677_c7_a2ea]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_a2ea]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_a2ea]
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_a2ea]
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(7 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1679_c33_e134]
signal BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_69c2]
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c7_e516]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_e516]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_return_output : unsigned(0 downto 0);

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
-- BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b
BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061
result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061
result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- n16_MUX_uxn_opcodes_h_l1646_c2_e061
n16_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
n16_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
n16_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
n16_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- t8_MUX_uxn_opcodes_h_l1646_c2_e061
t8_MUX_uxn_opcodes_h_l1646_c2_e061 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1646_c2_e061_cond,
t8_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue,
t8_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse,
t8_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

-- printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b
printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b : entity work.printf_uxn_opcodes_h_l1647_c3_c04b_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_left,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_right,
BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14
result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14
result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- n16_MUX_uxn_opcodes_h_l1651_c7_4e14
n16_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
n16_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- t8_MUX_uxn_opcodes_h_l1651_c7_4e14
t8_MUX_uxn_opcodes_h_l1651_c7_4e14 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1651_c7_4e14_cond,
t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue,
t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse,
t8_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_left,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_right,
BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- n16_MUX_uxn_opcodes_h_l1654_c7_6840
n16_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
n16_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
n16_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
n16_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- t8_MUX_uxn_opcodes_h_l1654_c7_6840
t8_MUX_uxn_opcodes_h_l1654_c7_6840 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1654_c7_6840_cond,
t8_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue,
t8_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse,
t8_MUX_uxn_opcodes_h_l1654_c7_6840_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_left,
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_right,
BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec
result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec
result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- n16_MUX_uxn_opcodes_h_l1658_c7_a0ec
n16_MUX_uxn_opcodes_h_l1658_c7_a0ec : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond,
n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue,
n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse,
n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- n16_MUX_uxn_opcodes_h_l1661_c7_0954
n16_MUX_uxn_opcodes_h_l1661_c7_0954 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1661_c7_0954_cond,
n16_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue,
n16_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse,
n16_MUX_uxn_opcodes_h_l1661_c7_0954_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae
CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_x,
CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_left,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_right,
BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- n16_MUX_uxn_opcodes_h_l1666_c7_aeaa
n16_MUX_uxn_opcodes_h_l1666_c7_aeaa : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond,
n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue,
n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse,
n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_left,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_right,
BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd
result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output);

-- n16_MUX_uxn_opcodes_h_l1669_c7_adcd
n16_MUX_uxn_opcodes_h_l1669_c7_adcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1669_c7_adcd_cond,
n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue,
n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse,
n16_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044
BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_left,
BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_right,
BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7
sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_ins,
sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_x,
sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_y,
sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b
CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_x,
CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134
BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_left,
BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_right,
BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_left,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_right,
BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 n16_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 t8_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 n16_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 t8_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 n16_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 t8_MUX_uxn_opcodes_h_l1654_c7_6840_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 n16_MUX_uxn_opcodes_h_l1661_c7_0954_return_output,
 CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output,
 n16_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output,
 sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_return_output,
 CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iffalse : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_9445 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_fab2 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1656_c3_4150 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_84e3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_b6fe : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1667_c3_19e0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_c7_aeaa_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_1481_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_00c0_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1679_c22_e3f6_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1680_c21_5583_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1662_l1670_DUPLICATE_1486_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1640_l1687_DUPLICATE_6e22_return_output : opcode_result_t;
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
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_right := to_unsigned(3, 2);
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_y := resize(to_signed(-3, 3), 4);
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_right := to_unsigned(8, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_right := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_9445 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1648_c3_9445;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_84e3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_84e3;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_right := to_unsigned(7, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_fab2 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1652_c3_fab2;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_right := to_unsigned(5, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_b6fe := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1664_c3_b6fe;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue := to_unsigned(1, 1);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1656_c3_4150 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1656_c3_4150;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1667_c3_19e0 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1667_c3_19e0;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue := to_unsigned(0, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c6_723b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output := result.u16_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l1658_c11_0d5b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output := result.u8_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1651_c11_b523] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_left;
     BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output := BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_c7_aeaa_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output := result.is_ram_write;

     -- BIN_OP_EQ[uxn_opcodes_h_l1682_c11_69c2] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_left;
     BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output := BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_d7e5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output := result.is_sp_shift;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5 LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output := result.sp_relative_shift;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1662_l1670_DUPLICATE_1486 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1662_l1670_DUPLICATE_1486_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_90f7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1654_c11_21d0] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_left;
     BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output := BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1679_c33_e134] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1666_c11_25a9] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_left;
     BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output := BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1669_c11_f253] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_left;
     BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output := BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1680_c21_5583] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1680_c21_5583_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1674_c22_1481] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_1481_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- sp_relative_shift[uxn_opcodes_h_l1672_c30_d8d7] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_ins;
     sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_x;
     sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_return_output := sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_return_output;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c6_723b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1651_c11_b523_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1654_c11_21d0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1658_c11_0d5b_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_90f7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1666_c11_25a9_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1669_c11_f253_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_d7e5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1682_c11_69c2_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_1481_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1662_l1670_DUPLICATE_1486_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1662_l1670_DUPLICATE_1486_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1680_c21_5583_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1654_l1651_l1669_l1646_l1666_l1661_l1658_DUPLICATE_46b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_4393_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1669_l1666_l1661_l1658_DUPLICATE_c7d7_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1682_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_c674_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_850f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1654_l1677_l1651_l1646_l1666_l1661_l1658_DUPLICATE_9a30_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1672_c30_d8d7_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1682_c7_e516] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1663_c3_21ae] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_return_output := CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1682_c7_e516] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1646_c1_e065] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1679_c22_e3f6] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1679_c22_e3f6_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1679_c33_e134_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1669_c7_adcd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;

     -- t8_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     t8_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     t8_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := t8_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1677_c7_a2ea] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output := result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1670_c3_8044] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_left;
     BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output := BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1677_c7_a2ea] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1670_c3_8044_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1679_c22_e3f6_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1663_c3_21ae_return_output;
     VAR_printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1646_c1_e065_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1682_c7_e516_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1682_c7_e516_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1677_c7_a2ea] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output := result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;

     -- t8_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := t8_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1675_c31_ed2b] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_return_output := CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_return_output;

     -- printf_uxn_opcodes_h_l1647_c3_c04b[uxn_opcodes_h_l1647_c3_c04b] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1647_c3_c04b_uxn_opcodes_h_l1647_c3_c04b_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1669_c7_adcd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_a2ea] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;

     -- n16_MUX[uxn_opcodes_h_l1669_c7_adcd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1669_c7_adcd_cond <= VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_cond;
     n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue;
     n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output := n16_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_a2ea] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1677_c7_a2ea_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     -- CAST_TO_uint8_t[uxn_opcodes_h_l1675_c21_00c0] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_00c0_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1675_c31_ed2b_return_output);

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1669_c7_adcd] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1669_c7_adcd] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output := result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- t8_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     t8_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     t8_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := t8_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1669_c7_adcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_00c0_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- n16_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     n16_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     n16_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := n16_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1669_c7_adcd] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output := result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1669_c7_adcd_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- n16_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1666_c7_aeaa] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output := result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1666_c7_aeaa_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- n16_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     n16_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     n16_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := n16_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_0954] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_0954_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1658_c7_a0ec] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output := result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;

     -- n16_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := n16_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1658_c7_a0ec_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1654_c7_6840] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output := result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- n16_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     n16_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     n16_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := n16_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1654_c7_6840_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1651_c7_4e14] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output := result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1651_c7_4e14_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1646_c2_e061] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output := result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1640_l1687_DUPLICATE_6e22 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1640_l1687_DUPLICATE_6e22_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_5abb(
     result,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c2_e061_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c2_e061_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1640_l1687_DUPLICATE_6e22_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_5abb_uxn_opcodes_h_l1640_l1687_DUPLICATE_6e22_return_output;
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
