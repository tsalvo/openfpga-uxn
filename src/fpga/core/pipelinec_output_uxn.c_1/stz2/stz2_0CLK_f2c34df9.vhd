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
-- BIN_OP_EQ[uxn_opcodes_h_l1641_c6_83ec]
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1641_c1_d172]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1641_c2_9134]
signal n16_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1641_c2_9134]
signal t8_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1641_c2_9134]
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1641_c2_9134]
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c2_9134]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1641_c2_9134]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c2_9134]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c2_9134]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c2_9134]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(3 downto 0);

-- printf_uxn_opcodes_h_l1642_c3_9d8a[uxn_opcodes_h_l1642_c3_9d8a]
signal printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_50b5]
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_d8a3]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_8196]
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal n16_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(15 downto 0);

-- t8_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal t8_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(7 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1649_c7_cea0]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_a865]
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1653_c7_25af]
signal n16_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_25af]
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_25af]
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_25af]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_25af]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_25af]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_25af]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1653_c7_25af]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_d53f]
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_eb6d]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(3 downto 0);

-- CONST_SL_8[uxn_opcodes_h_l1658_c3_18f6]
signal CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_x : unsigned(15 downto 0);
signal CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_3fbc]
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1661_c7_3971]
signal n16_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_3971]
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(7 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_3971]
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(15 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_3971]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_3971]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c7_3971]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_3971]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c7_3971]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(3 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(3 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_2300]
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output : unsigned(0 downto 0);

-- n16_MUX[uxn_opcodes_h_l1664_c7_3334]
signal n16_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(15 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_3334]
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_3334]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1664_c7_3334]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1664_c7_3334]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : signed(3 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : signed(3 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1664_c7_3334]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_3334]
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l1665_c3_b6a3]
signal BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output : unsigned(15 downto 0);

-- sp_relative_shift[uxn_opcodes_h_l1667_c30_0652]
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_ins : unsigned(7 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_x : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_y : signed(3 downto 0);
signal sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_return_output : signed(3 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l1670_c31_5a74]
signal CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_0cdb]
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output : unsigned(0 downto 0);

-- result_u8_value_MUX[uxn_opcodes_h_l1672_c7_b911]
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(7 downto 0);
signal result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_b911]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1672_c7_b911]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1672_c7_b911]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(0 downto 0);

-- result_u16_value_MUX[uxn_opcodes_h_l1672_c7_b911]
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(15 downto 0);
signal result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(15 downto 0);

-- BIN_OP_PLUS[uxn_opcodes_h_l1674_c33_bd12]
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_left : unsigned(7 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_right : unsigned(0 downto 0);
signal BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_return_output : unsigned(8 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_2d9b]
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_d28c]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output : unsigned(0 downto 0);

-- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_d28c]
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_cond : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse : unsigned(0 downto 0);
signal result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output : unsigned(0 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_643c( ref_toks_0 : opcode_result_t;
 ref_toks_1 : unsigned;
 ref_toks_2 : unsigned;
 ref_toks_3 : unsigned;
 ref_toks_4 : unsigned;
 ref_toks_5 : signed;
 ref_toks_6 : unsigned;
 ref_toks_7 : unsigned) return opcode_result_t is
 
  variable base : opcode_result_t; 
  variable return_output : opcode_result_t;
begin
      base := ref_toks_0;
      base.u8_value := ref_toks_1;
      base.u16_value := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_ram_write := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_sp_shift := ref_toks_6;
      base.stack_address_sp_offset := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_left,
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_right,
BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_return_output);

-- n16_MUX_uxn_opcodes_h_l1641_c2_9134
n16_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
n16_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
n16_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
n16_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- t8_MUX_uxn_opcodes_h_l1641_c2_9134
t8_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
t8_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
t8_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
t8_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

-- printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a
printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a : entity work.printf_uxn_opcodes_h_l1642_c3_9d8a_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_left,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_right,
BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output);

-- n16_MUX_uxn_opcodes_h_l1646_c7_d8a3
n16_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- t8_MUX_uxn_opcodes_h_l1646_c7_d8a3
t8_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_left,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_right,
BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output);

-- n16_MUX_uxn_opcodes_h_l1649_c7_cea0
n16_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
n16_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- t8_MUX_uxn_opcodes_h_l1649_c7_cea0
t8_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
t8_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_left,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_right,
BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output);

-- n16_MUX_uxn_opcodes_h_l1653_c7_25af
n16_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
n16_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
n16_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
n16_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_left,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_right,
BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output);

-- n16_MUX_uxn_opcodes_h_l1656_c7_eb6d
n16_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output);

-- CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6
CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_x,
CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_left,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_right,
BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output);

-- n16_MUX_uxn_opcodes_h_l1661_c7_3971
n16_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
n16_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
n16_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
n16_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971 : entity work.MUX_uint1_t_uint4_t_uint4_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_left,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_right,
BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output);

-- n16_MUX_uxn_opcodes_h_l1664_c7_3334
n16_MUX_uxn_opcodes_h_l1664_c7_3334 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l1664_c7_3334_cond,
n16_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue,
n16_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse,
n16_MUX_uxn_opcodes_h_l1664_c7_3334_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334 : entity work.MUX_uint1_t_int4_t_int4_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3
BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_left,
BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_right,
BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output);

-- sp_relative_shift_uxn_opcodes_h_l1667_c30_0652
sp_relative_shift_uxn_opcodes_h_l1667_c30_0652 : entity work.sp_relative_shift_0CLK_6f2c5aad port map (
sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_ins,
sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_x,
sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_y,
sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_return_output);

-- CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74
CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74 : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_x,
CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_left,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_right,
BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output);

-- result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse,
result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_return_output);

-- result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse,
result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output);

-- BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12 : entity work.BIN_OP_PLUS_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_left,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_right,
BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_left,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_right,
BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output);

-- result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_cond,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse,
result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_return_output,
 n16_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 t8_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output,
 n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output,
 n16_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 t8_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output,
 n16_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output,
 n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output,
 CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output,
 n16_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output,
 n16_MUX_uxn_opcodes_h_l1664_c7_3334_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output,
 BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output,
 sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_return_output,
 CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output,
 result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_return_output,
 result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output,
 BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output,
 result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iffalse : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_7a7e : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_fc15 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_ccb0 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_c8d3 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_03c5 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond : unsigned(0 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_x : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_d869 : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1661_c7_3971_return_output : unsigned(3 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : signed(3 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output : unsigned(15 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_ins : unsigned(7 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_x : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_y : signed(3 downto 0);
 variable VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_return_output : signed(3 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1669_c22_9ea4_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c21_30c1_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output : unsigned(0 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(7 downto 0);
 variable VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse : unsigned(15 downto 0);
 variable VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_return_output : unsigned(8 downto 0);
 variable VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_c48c_return_output : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_4cf2_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_cond : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output : signed(3 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_08f9_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1682_l1635_DUPLICATE_680c_return_output : opcode_result_t;
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
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_right := to_unsigned(3, 2);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_right := to_unsigned(8, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_c8d3 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1654_c3_c8d3;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_03c5 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1659_c3_03c5;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_fc15 := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1647_c3_fc15;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_right := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_ccb0 := resize(to_unsigned(3, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1651_c3_ccb0;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iffalse := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_x := signed(std_logic_vector(resize(to_unsigned(3, 2), 4)));
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_right := to_unsigned(5, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_d869 := resize(to_unsigned(2, 2), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1662_c3_d869;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_7a7e := resize(to_unsigned(1, 1), 4);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1643_c3_7a7e;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue := to_unsigned(0, 1);
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_y := resize(to_signed(-3, 3), 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_right := to_unsigned(4, 3);
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue := to_unsigned(1, 1);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_right := to_unsigned(6, 3);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iftrue := VAR_CLOCK_ENABLE;
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_ins := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_left := VAR_phase;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_left := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := t8;
     -- CAST_TO_uint16_t[uxn_opcodes_h_l1669_c22_9ea4] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1669_c22_9ea4_return_output := CAST_TO_uint16_t_uint8_t(
     t8);

     -- CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output := result.u8_value;

     -- CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22 LATENCY=0
     VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output := result.u16_value;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1675_c21_4cf2] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_4cf2_return_output := CAST_TO_uint8_t_uint16_t(
     n16);

     -- BIN_OP_EQ[uxn_opcodes_h_l1664_c11_2300] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_left;
     BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output := BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1646_c11_50b5] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_left;
     BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output := BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output := result.is_opc_done;

     -- BIN_OP_PLUS[uxn_opcodes_h_l1674_c33_bd12] LATENCY=0
     -- Inputs
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_left <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_left;
     BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_right <= VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_right;
     -- Outputs
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_return_output := BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_08f9 LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_08f9_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l1641_c6_83ec] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_left;
     BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output := BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1672_c11_0cdb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1653_c11_a865] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_left;
     BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output := BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;

     -- sp_relative_shift[uxn_opcodes_h_l1667_c30_0652] LATENCY=0
     -- Inputs
     sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_ins <= VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_ins;
     sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_x <= VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_x;
     sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_y <= VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_y;
     -- Outputs
     VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_return_output := sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_return_output;

     -- CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a LATENCY=0
     VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1661_c11_3fbc] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_left;
     BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output := BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1677_c11_2d9b] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_left;
     BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output := BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1649_c11_8196] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_left;
     BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output := BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1656_c11_d53f] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_left;
     BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output := BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;

     -- result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1661_c7_3971_return_output := result.stack_address_sp_offset;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output := result.is_sp_shift;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output := result.is_ram_write;

     -- Submodule level 1
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1641_c6_83ec_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1646_c11_50b5_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1649_c11_8196_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1653_c11_a865_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1656_c11_d53f_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1661_c11_3fbc_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1664_c11_2300_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1672_c11_0cdb_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1677_c11_2d9b_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1669_c22_9ea4_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_08f9_return_output;
     VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l1665_l1657_DUPLICATE_08f9_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1675_c21_4cf2_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse := VAR_CONST_REF_RD_int4_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1641_l1664_DUPLICATE_a87a_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse := VAR_CONST_REF_RD_uint16_t_opcode_result_t_u16_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_2d22_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1664_DUPLICATE_681e_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_ram_write_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1677_l1646_l1672_l1641_DUPLICATE_5c30_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_d3f8_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_u8_value_d41d_uxn_opcodes_h_l1661_l1656_l1653_l1649_l1646_l1672_l1641_DUPLICATE_0093_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_result_stack_address_sp_offset_FALSE_INPUT_MUX_CONST_REF_RD_uint4_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue := VAR_sp_relative_shift_uxn_opcodes_h_l1667_c30_0652_return_output;
     -- t8_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := t8_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1672_c7_b911] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1672_c7_b911] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output := result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1641_c1_d172] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1677_c7_d28c] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1664_c7_3334] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l1665_c3_b6a3] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_left;
     BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output := BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- CAST_TO_uint16_t[uxn_opcodes_h_l1674_c22_c48c] LATENCY=0
     VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_c48c_return_output := CAST_TO_uint16_t_uint9_t(
     VAR_BIN_OP_PLUS_uxn_opcodes_h_l1674_c33_bd12_return_output);

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1677_c7_d28c] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output;

     -- CONST_SL_8[uxn_opcodes_h_l1658_c3_18f6] LATENCY=0
     -- Inputs
     CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_x <= VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_x;
     -- Outputs
     VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_return_output := CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_return_output;

     -- Submodule level 2
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_x := VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l1665_c3_b6a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue := VAR_CAST_TO_uint16_t_uxn_opcodes_h_l1674_c22_c48c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue := VAR_CONST_SL_8_uxn_opcodes_h_l1658_c3_18f6_return_output;
     VAR_printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1641_c1_d172_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1677_c7_d28c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1664_c7_3334] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1672_c7_b911] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output := result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;

     -- n16_MUX[uxn_opcodes_h_l1664_c7_3334] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1664_c7_3334_cond <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_cond;
     n16_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue;
     n16_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_return_output := n16_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;

     -- t8_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- printf_uxn_opcodes_h_l1642_c3_9d8a[uxn_opcodes_h_l1642_c3_9d8a] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1642_c3_9d8a_uxn_opcodes_h_l1642_c3_9d8a_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1672_c7_b911] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1672_c7_b911] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l1670_c31_5a74] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_x <= VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_return_output := CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- Submodule level 3
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1672_c7_b911_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l1670_c21_30c1] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c21_30c1_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l1670_c31_5a74_return_output);

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     n16_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     n16_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := n16_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1664_c7_3334] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1664_c7_3334] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output := result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;

     -- t8_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     t8_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     t8_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := t8_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1664_c7_3334] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- Submodule level 4
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l1670_c21_30c1_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;
     -- n16_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1664_c7_3334] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output := result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1664_c7_3334_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1661_c7_3971] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output := result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- n16_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     n16_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     n16_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := n16_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1661_c7_3971_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- n16_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := n16_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1656_c7_eb6d] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output := result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1656_c7_eb6d_return_output;
     -- result_is_ram_write_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- n16_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1653_c7_25af] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output := result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_n16_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1653_c7_25af_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- n16_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     n16_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     n16_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := n16_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_u16_value_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1649_c7_cea0] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output := result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;

     -- Submodule level 9
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_result_u16_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1649_c7_cea0_return_output;
     -- result_u16_value_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- result_is_ram_write_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- result_u8_value_MUX[uxn_opcodes_h_l1646_c7_d8a3] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output := result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- Submodule level 10
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse := VAR_result_u8_value_MUX_uxn_opcodes_h_l1646_c7_d8a3_return_output;
     -- result_u8_value_MUX[uxn_opcodes_h_l1641_c2_9134] LATENCY=0
     -- Inputs
     result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_cond;
     result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iftrue;
     result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse <= VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_iffalse;
     -- Outputs
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output := result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output;

     -- Submodule level 11
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1682_l1635_DUPLICATE_680c LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1682_l1635_DUPLICATE_680c_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_643c(
     result,
     VAR_result_u8_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
     VAR_result_u16_value_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
     VAR_result_is_ram_write_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1641_c2_9134_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1641_c2_9134_return_output);

     -- Submodule level 12
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1682_l1635_DUPLICATE_680c_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_643c_uxn_opcodes_h_l1682_l1635_DUPLICATE_680c_return_output;
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
