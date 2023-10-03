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
-- Submodules: 123
entity ora2_0CLK_201aeef3 is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 pc : in unsigned(15 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 previous_ram_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end ora2_0CLK_201aeef3;
architecture arch of ora2_0CLK_201aeef3 is
-- Types and such
-- Declarations
attribute mark_debug : string;
constant PIPELINE_LATENCY : integer := 0;
-- All of the wires/regs in function

-- All user state registers
signal t16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal n16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal tmp16 : unsigned(15 downto 0) := to_unsigned(0, 16);
signal result : opcode_result_t := opcode_result_t_NULL;
signal REG_COMB_t16 : unsigned(15 downto 0);
signal REG_COMB_n16 : unsigned(15 downto 0);
signal REG_COMB_tmp16 : unsigned(15 downto 0);
signal REG_COMB_result : opcode_result_t;

-- Each function instance gets signals
-- BIN_OP_EQ[uxn_opcodes_h_l676_c6_8914]
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_70e8]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l676_c2_3503]
signal tmp16_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l676_c2_3503]
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_3503]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_3503]
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l676_c2_3503]
signal result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_3503]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_3503]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l676_c2_3503]
signal result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l676_c2_3503]
signal t16_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l676_c2_3503]
signal n16_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(15 downto 0);

-- printf_uxn_opcodes_h_l677_c3_8974[uxn_opcodes_h_l677_c3_8974]
signal printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l682_c11_e7be]
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l682_c7_1c08]
signal tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l682_c7_1c08]
signal result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l682_c7_1c08]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l682_c7_1c08]
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l682_c7_1c08]
signal result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l682_c7_1c08]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l682_c7_1c08]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l682_c7_1c08]
signal result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l682_c7_1c08]
signal t16_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l682_c7_1c08]
signal n16_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l685_c11_6056]
signal BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l685_c7_7a99]
signal tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l685_c7_7a99]
signal result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l685_c7_7a99]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l685_c7_7a99]
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l685_c7_7a99]
signal result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c7_7a99]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l685_c7_7a99]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l685_c7_7a99]
signal result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l685_c7_7a99]
signal t16_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l685_c7_7a99]
signal n16_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l690_c11_6ba7]
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l690_c7_53b1]
signal tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l690_c7_53b1]
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_53b1]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_53b1]
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l690_c7_53b1]
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_53b1]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_53b1]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l690_c7_53b1]
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l690_c7_53b1]
signal t16_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l690_c7_53b1]
signal n16_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l693_c11_b61d]
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(7 downto 0);

-- t16_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal t16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(15 downto 0);
signal t16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(15 downto 0);

-- n16_MUX[uxn_opcodes_h_l693_c7_ec0e]
signal n16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l694_c3_cfdd]
signal BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l697_c11_e071]
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l697_c7_7dda]
signal tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l697_c7_7dda]
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_7dda]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_7dda]
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l697_c7_7dda]
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_7dda]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_7dda]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l697_c7_7dda]
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l697_c7_7dda]
signal n16_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l700_c11_74e7]
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l700_c7_6480]
signal tmp16_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l700_c7_6480]
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_6480]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_6480]
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l700_c7_6480]
signal result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_6480]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_6480]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l700_c7_6480]
signal result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l700_c7_6480]
signal n16_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l705_c11_f26c]
signal BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l705_c7_a915]
signal tmp16_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l705_c7_a915]
signal result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l705_c7_a915]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l705_c7_a915]
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l705_c7_a915]
signal result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l705_c7_a915]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l705_c7_a915]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l705_c7_a915]
signal result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l705_c7_a915]
signal n16_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l708_c11_8a1d]
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output : unsigned(0 downto 0);

-- tmp16_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(15 downto 0);
signal tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(15 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : signed(7 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(7 downto 0);

-- n16_MUX[uxn_opcodes_h_l708_c7_dbcd]
signal n16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
signal n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(15 downto 0);
signal n16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l709_c3_5895]
signal BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output : unsigned(15 downto 0);

-- BIN_OP_OR[uxn_opcodes_h_l710_c11_af40]
signal BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_left : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_right : unsigned(15 downto 0);
signal BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_return_output : unsigned(15 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l713_c32_a60f]
signal BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l713_c32_526d]
signal BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l713_c32_1af8]
signal MUX_uxn_opcodes_h_l713_c32_1af8_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l713_c32_1af8_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l713_c32_1af8_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l713_c32_1af8_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l715_c11_a1e4]
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l715_c7_0a3a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_0a3a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(0 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l715_c7_0a3a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l715_c7_0a3a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l715_c7_0a3a]
signal result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l721_c11_3778]
signal BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output : unsigned(0 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c7_30b8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l721_c7_30b8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l721_c7_30b8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l721_c7_30b8]
signal result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(7 downto 0);

-- CONST_SR_8[uxn_opcodes_h_l723_c34_26bf]
signal CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_x : unsigned(15 downto 0);
signal CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_return_output : unsigned(15 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l725_c11_fa59]
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_right : unsigned(3 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_f115]
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_f115]
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_return_output : unsigned(0 downto 0);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_x : unsigned(15 downto 0);
signal CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output : unsigned(15 downto 0);

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

function CONST_REF_RD_opcode_result_t_opcode_result_t_28d7( ref_toks_0 : opcode_result_t;
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
      base.is_stack_read := ref_toks_1;
      base.sp_relative_shift := ref_toks_2;
      base.is_opc_done := ref_toks_3;
      base.is_stack_write := ref_toks_4;
      base.is_sp_shift := ref_toks_5;
      base.stack_address_sp_offset := ref_toks_6;
      base.stack_value := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914
BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_left,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_right,
BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_return_output);

-- tmp16_MUX_uxn_opcodes_h_l676_c2_3503
tmp16_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l676_c2_3503_cond,
tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
tmp16_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503
result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503
result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503
result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_cond,
result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- t16_MUX_uxn_opcodes_h_l676_c2_3503
t16_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l676_c2_3503_cond,
t16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
t16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
t16_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- n16_MUX_uxn_opcodes_h_l676_c2_3503
n16_MUX_uxn_opcodes_h_l676_c2_3503 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l676_c2_3503_cond,
n16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue,
n16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse,
n16_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

-- printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974
printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974 : entity work.printf_uxn_opcodes_h_l677_c3_8974_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be
BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_left,
BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_right,
BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output);

-- tmp16_MUX_uxn_opcodes_h_l682_c7_1c08
tmp16_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08
result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08
result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08
result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- t16_MUX_uxn_opcodes_h_l682_c7_1c08
t16_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
t16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
t16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
t16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- n16_MUX_uxn_opcodes_h_l682_c7_1c08
n16_MUX_uxn_opcodes_h_l682_c7_1c08 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l682_c7_1c08_cond,
n16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue,
n16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse,
n16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056
BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_left,
BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_right,
BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output);

-- tmp16_MUX_uxn_opcodes_h_l685_c7_7a99
tmp16_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99
result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99
result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99
result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- t16_MUX_uxn_opcodes_h_l685_c7_7a99
t16_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
t16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
t16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
t16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- n16_MUX_uxn_opcodes_h_l685_c7_7a99
n16_MUX_uxn_opcodes_h_l685_c7_7a99 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l685_c7_7a99_cond,
n16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue,
n16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse,
n16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7
BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_left,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_right,
BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l690_c7_53b1
tmp16_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1
result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- t16_MUX_uxn_opcodes_h_l690_c7_53b1
t16_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
t16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
t16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
t16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- n16_MUX_uxn_opcodes_h_l690_c7_53b1
n16_MUX_uxn_opcodes_h_l690_c7_53b1 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l690_c7_53b1_cond,
n16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue,
n16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse,
n16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d
BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_left,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_right,
BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e
tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e
result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e
result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e
result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- t16_MUX_uxn_opcodes_h_l693_c7_ec0e
t16_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
t16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
t16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- n16_MUX_uxn_opcodes_h_l693_c7_ec0e
n16_MUX_uxn_opcodes_h_l693_c7_ec0e : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond,
n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue,
n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse,
n16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd
BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_left,
BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_right,
BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071
BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_left,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_right,
BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output);

-- tmp16_MUX_uxn_opcodes_h_l697_c7_7dda
tmp16_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda
result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- n16_MUX_uxn_opcodes_h_l697_c7_7dda
n16_MUX_uxn_opcodes_h_l697_c7_7dda : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l697_c7_7dda_cond,
n16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue,
n16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse,
n16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7
BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_left,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_right,
BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output);

-- tmp16_MUX_uxn_opcodes_h_l700_c7_6480
tmp16_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l700_c7_6480_cond,
tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
tmp16_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480
result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480
result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_cond,
result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- n16_MUX_uxn_opcodes_h_l700_c7_6480
n16_MUX_uxn_opcodes_h_l700_c7_6480 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l700_c7_6480_cond,
n16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue,
n16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse,
n16_MUX_uxn_opcodes_h_l700_c7_6480_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c
BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_left,
BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_right,
BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output);

-- tmp16_MUX_uxn_opcodes_h_l705_c7_a915
tmp16_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l705_c7_a915_cond,
tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
tmp16_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915
result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915
result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915
result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_cond,
result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- n16_MUX_uxn_opcodes_h_l705_c7_a915
n16_MUX_uxn_opcodes_h_l705_c7_a915 : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l705_c7_a915_cond,
n16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue,
n16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse,
n16_MUX_uxn_opcodes_h_l705_c7_a915_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d
BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_left,
BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_right,
BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output);

-- tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd
tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd
result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- n16_MUX_uxn_opcodes_h_l708_c7_dbcd
n16_MUX_uxn_opcodes_h_l708_c7_dbcd : entity work.MUX_uint1_t_uint16_t_uint16_t_0CLK_de264c78 port map (
n16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond,
n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue,
n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse,
n16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l709_c3_5895
BIN_OP_OR_uxn_opcodes_h_l709_c3_5895 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_left,
BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_right,
BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output);

-- BIN_OP_OR_uxn_opcodes_h_l710_c11_af40
BIN_OP_OR_uxn_opcodes_h_l710_c11_af40 : entity work.BIN_OP_OR_uint16_t_uint16_t_0CLK_de264c78 port map (
BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_left,
BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_right,
BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f
BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_left,
BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_right,
BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l713_c32_526d
BIN_OP_GT_uxn_opcodes_h_l713_c32_526d : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_left,
BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_right,
BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_return_output);

-- MUX_uxn_opcodes_h_l713_c32_1af8
MUX_uxn_opcodes_h_l713_c32_1af8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l713_c32_1af8_cond,
MUX_uxn_opcodes_h_l713_c32_1af8_iftrue,
MUX_uxn_opcodes_h_l713_c32_1af8_iffalse,
MUX_uxn_opcodes_h_l713_c32_1af8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4
BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_left,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_right,
BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a
result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a
result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a
result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_cond,
result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778
BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_left,
BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_right,
BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8
result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8
result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_cond,
result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_return_output);

-- CONST_SR_8_uxn_opcodes_h_l723_c34_26bf
CONST_SR_8_uxn_opcodes_h_l723_c34_26bf : entity work.CONST_SR_8_uint16_t_0CLK_de264c78 port map (
CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_x,
CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59
BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59 : entity work.BIN_OP_EQ_uint8_t_uint4_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_left,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_right,
BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_return_output);

-- CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19
CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19 : entity work.CONST_SL_8_uint16_t_0CLK_de264c78 port map (
CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_x,
CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output);



-- Combinatorial process for pipeline stages
process (
 CLOCK_ENABLE,
 -- Inputs
 phase,
 ins,
 pc,
 previous_stack_read,
 previous_ram_read,
 -- Registers
 t16,
 n16,
 tmp16,
 result,
 -- All submodule outputs
 BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_return_output,
 tmp16_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 t16_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 n16_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output,
 tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 t16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 n16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output,
 tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 t16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 n16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output,
 tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 t16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 n16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output,
 tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 t16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 n16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output,
 BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output,
 tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 n16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output,
 tmp16_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 n16_MUX_uxn_opcodes_h_l700_c7_6480_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output,
 tmp16_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 n16_MUX_uxn_opcodes_h_l705_c7_a915_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output,
 tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 n16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output,
 BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output,
 BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_return_output,
 BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_return_output,
 BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_return_output,
 MUX_uxn_opcodes_h_l713_c32_1af8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_return_output,
 CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_return_output,
 CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_pc : unsigned(15 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_previous_ram_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iffalse : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l679_c3_03b7 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l683_c3_b587 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l688_c3_896f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_8ccc : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_204c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(15 downto 0);
 variable VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_0c88 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_cf4c : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l706_c3_312f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output : unsigned(0 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(15 downto 0);
 variable VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse : unsigned(15 downto 0);
 variable VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_left : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_right : unsigned(15 downto 0);
 variable VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_return_output : unsigned(15 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l713_c32_1af8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l713_c32_1af8_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l713_c32_1af8_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l713_c32_1af8_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_d99e : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_cond : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l719_c24_7671_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_2ec0 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_cond : unsigned(0 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_x : unsigned(15 downto 0);
 variable VAR_CAST_TO_uint8_t_uxn_opcodes_h_l723_c24_496e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_right : unsigned(3 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output : unsigned(0 downto 0);
 variable VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l686_l694_l701_l709_DUPLICATE_73df_return_output : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_x : unsigned(15 downto 0);
 variable VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output : unsigned(15 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l721_l708_DUPLICATE_040e_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l672_l730_DUPLICATE_11b0_return_output : opcode_result_t;
 -- State registers comb logic variables
variable REG_VAR_t16 : unsigned(15 downto 0);
variable REG_VAR_n16 : unsigned(15 downto 0);
variable REG_VAR_tmp16 : unsigned(15 downto 0);
variable REG_VAR_result : opcode_result_t;
begin

  -- STATE REGS
  -- Default read regs into vars
  REG_VAR_t16 := t16;
  REG_VAR_n16 := n16;
  REG_VAR_tmp16 := tmp16;
  REG_VAR_result := result;
 -- Constants and things derived from constants alone
     -- Submodule level 0
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_right := to_unsigned(8, 4);
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_right := to_unsigned(2, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_cf4c := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l703_c3_cf4c;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l713_c32_1af8_iftrue := signed(std_logic_vector(resize(to_unsigned(2, 2), 8)));
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_right := to_unsigned(128, 8);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_2ec0 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l722_c3_2ec0;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_8ccc := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l691_c3_8ccc;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_204c := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l695_c3_204c;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := to_unsigned(0, 1);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iffalse := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l683_c3_b587 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l683_c3_b587;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_right := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_right := to_unsigned(6, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_d99e := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l718_c3_d99e;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_0c88 := resize(to_unsigned(4, 3), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l698_c3_0c88;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_right := to_unsigned(5, 3);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iftrue := to_unsigned(1, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l706_c3_312f := resize(to_unsigned(3, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l706_c3_312f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_right := to_unsigned(7, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_right := to_unsigned(10, 4);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l679_c3_03b7 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l679_c3_03b7;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_right := to_unsigned(3, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_right := to_unsigned(1, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_right := to_unsigned(0, 1);
     VAR_MUX_uxn_opcodes_h_l713_c32_1af8_iffalse := resize(to_signed(-2, 3), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_right := to_unsigned(4, 3);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l688_c3_896f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l688_c3_896f;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_right := to_unsigned(11, 4);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_right := to_unsigned(9, 4);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := to_unsigned(1, 1);

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
     VAR_previous_ram_read := previous_ram_read;

     -- Submodule level 0
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_left := VAR_ins;
     VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_left := n16;
     VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := n16;
     VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := n16;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_left := VAR_phase;
     VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_left := t16;
     VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_right := t16;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := t16;
     VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := t16;
     VAR_CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_x := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := tmp16;
     VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := tmp16;
     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l682_c11_e7be] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_left;
     BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output := BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l708_c11_8a1d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_left;
     BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output := BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12 LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output := result.sp_relative_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l690_c11_6ba7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_left;
     BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output := BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l676_c6_8914] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_left;
     BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output := BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l697_c11_e071] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_left;
     BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output := BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l713_c32_a60f] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_left;
     BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_return_output := BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l725_c11_fa59] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_left;
     BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output := BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l685_c11_6056] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_left;
     BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output := BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l721_c11_3778] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_left;
     BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output := BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output;

     -- CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l686_l694_l701_l709_DUPLICATE_73df LATENCY=0
     VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l686_l694_l701_l709_DUPLICATE_73df_return_output := CAST_TO_uint16_t_uint8_t(
     VAR_previous_stack_read);

     -- BIN_OP_EQ[uxn_opcodes_h_l693_c11_b61d] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_left;
     BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output := BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l721_l708_DUPLICATE_040e LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l721_l708_DUPLICATE_040e_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l700_c11_74e7] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_left;
     BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output := BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output := result.stack_value;

     -- BIN_OP_EQ[uxn_opcodes_h_l705_c11_f26c] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_left;
     BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output := BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l719_c24_7671] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l719_c24_7671_return_output := CAST_TO_uint8_t_uint16_t(
     tmp16);

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output := result.is_stack_write;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output := result.is_stack_read;

     -- BIN_OP_EQ[uxn_opcodes_h_l715_c11_a1e4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_left;
     BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output := BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output;

     -- CONST_SR_8[uxn_opcodes_h_l723_c34_26bf] LATENCY=0
     -- Inputs
     CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_x <= VAR_CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_x;
     -- Outputs
     VAR_CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_return_output := CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_return_output;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_left := VAR_BIN_OP_AND_uxn_opcodes_h_l713_c32_a60f_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l676_c6_8914_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l682_c11_e7be_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l685_c11_6056_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l690_c11_6ba7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l693_c11_b61d_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l697_c11_e071_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l700_c11_74e7_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l705_c11_f26c_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l708_c11_8a1d_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l715_c11_a1e4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l721_c11_3778_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l725_c11_fa59_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l686_l694_l701_l709_DUPLICATE_73df_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_right := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l686_l694_l701_l709_DUPLICATE_73df_return_output;
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_x := VAR_CAST_TO_uint16_t_uint8_t_uxn_opcodes_h_l686_l694_l701_l709_DUPLICATE_73df_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l719_c24_7671_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_ce12_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l705_l700_l697_l725_l693_l721_l690_l715_l685_l708_l682_DUPLICATE_8681_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l690_l715_l685_l682_DUPLICATE_294a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l705_l700_l697_l693_l690_l685_l708_l682_DUPLICATE_d9ee_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l705_l676_l700_l697_l725_l693_l721_l690_l685_l708_l682_DUPLICATE_b067_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l721_l708_DUPLICATE_040e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l721_l708_DUPLICATE_040e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l705_l676_l700_l697_l693_l721_l690_l685_l708_l682_DUPLICATE_7067_return_output;
     -- CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19 LATENCY=0
     -- Inputs
     CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_x <= VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_x;
     -- Outputs
     VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output := CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output;

     -- BIN_OP_GT[uxn_opcodes_h_l713_c32_526d] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_left;
     BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_return_output := BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l715_c7_0a3a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l725_c7_f115] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l676_c1_70e8] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l709_c3_5895] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_left;
     BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output := BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l725_c7_f115] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l694_c3_cfdd] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_left;
     BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_return_output := BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_return_output;

     -- CAST_TO_uint8_t[uxn_opcodes_h_l723_c24_496e] LATENCY=0
     VAR_CAST_TO_uint8_t_uxn_opcodes_h_l723_c24_496e_return_output := CAST_TO_uint8_t_uint16_t(
     VAR_CONST_SR_8_uxn_opcodes_h_l723_c34_26bf_return_output);

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l721_c7_30b8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l713_c32_1af8_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l713_c32_526d_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l694_c3_cfdd_return_output;
     VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_left := VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l709_c3_5895_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue := VAR_CAST_TO_uint8_t_uxn_opcodes_h_l723_c24_496e_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue := VAR_CONST_SL_8_uint16_t_uxn_opcodes_h_l702_l687_DUPLICATE_bc19_return_output;
     VAR_printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l676_c1_70e8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l725_c7_f115_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l725_c7_f115_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;
     -- t16_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := t16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- printf_uxn_opcodes_h_l677_c3_8974[uxn_opcodes_h_l677_c3_8974] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l677_c3_8974_uxn_opcodes_h_l677_c3_8974_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l721_c7_30b8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l721_c7_30b8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_return_output := result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l721_c7_30b8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;

     -- n16_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := n16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- MUX[uxn_opcodes_h_l713_c32_1af8] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l713_c32_1af8_cond <= VAR_MUX_uxn_opcodes_h_l713_c32_1af8_cond;
     MUX_uxn_opcodes_h_l713_c32_1af8_iftrue <= VAR_MUX_uxn_opcodes_h_l713_c32_1af8_iftrue;
     MUX_uxn_opcodes_h_l713_c32_1af8_iffalse <= VAR_MUX_uxn_opcodes_h_l713_c32_1af8_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l713_c32_1af8_return_output := MUX_uxn_opcodes_h_l713_c32_1af8_return_output;

     -- BIN_OP_OR[uxn_opcodes_h_l710_c11_af40] LATENCY=0
     -- Inputs
     BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_left <= VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_left;
     BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_right <= VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_right;
     -- Outputs
     VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_return_output := BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l715_c7_0a3a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- Submodule level 3
     VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := VAR_BIN_OP_OR_uxn_opcodes_h_l710_c11_af40_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue := VAR_MUX_uxn_opcodes_h_l713_c32_1af8_return_output;
     VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_n16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l721_c7_30b8_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_t16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- n16_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     n16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     n16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_return_output := n16_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l715_c7_0a3a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output := result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;

     -- t16_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     t16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     t16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := t16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l715_c7_0a3a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l715_c7_0a3a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- Submodule level 4
     VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_n16_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l715_c7_0a3a_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_t16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     -- t16_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     t16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     t16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := t16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_return_output := tmp16_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- n16_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     n16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     n16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_return_output := n16_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l708_c7_dbcd] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_cond;
     result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output := result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- Submodule level 5
     VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_n16_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l708_c7_dbcd_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_t16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_return_output := tmp16_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_return_output := result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l705_c7_a915] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- n16_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     n16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     n16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := n16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- t16_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     t16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     t16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := t16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- Submodule level 6
     VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_n16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l705_c7_a915_return_output;
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_t16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_return_output := result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- t16_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     t16_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     t16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     t16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_return_output := t16_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l700_c7_6480] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_return_output;

     -- n16_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := n16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- Submodule level 7
     VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_n16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l700_c7_6480_return_output;
     REG_VAR_t16 := VAR_t16_MUX_uxn_opcodes_h_l676_c2_3503_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- n16_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     n16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     n16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := n16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l697_c7_7dda] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_cond;
     result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_return_output := result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- Submodule level 8
     VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_n16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l697_c7_7dda_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l693_c7_ec0e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- n16_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     n16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     n16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := n16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- Submodule level 9
     VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_n16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l693_c7_ec0e_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- n16_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     n16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     n16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := n16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l690_c7_53b1] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_cond;
     result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_return_output := result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- Submodule level 10
     VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_n16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l690_c7_53b1_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     -- tmp16_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- n16_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     n16_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     n16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     n16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_return_output := n16_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l685_c7_7a99] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_cond;
     result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_return_output := result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;

     -- Submodule level 11
     REG_VAR_n16 := VAR_n16_MUX_uxn_opcodes_h_l676_c2_3503_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l685_c7_7a99_return_output;
     VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_tmp16_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- tmp16_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     tmp16_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_return_output := tmp16_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l682_c7_1c08] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_cond;
     result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_return_output := result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;

     -- Submodule level 12
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l682_c7_1c08_return_output;
     REG_VAR_tmp16 := VAR_tmp16_MUX_uxn_opcodes_h_l676_c2_3503_return_output;
     -- result_is_stack_write_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l676_c2_3503] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_cond;
     result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_return_output := result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_return_output;

     -- Submodule level 13
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l672_l730_DUPLICATE_11b0 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l672_l730_DUPLICATE_11b0_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_28d7(
     result,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l676_c2_3503_return_output,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l676_c2_3503_return_output);

     -- Submodule level 14
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l672_l730_DUPLICATE_11b0_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_28d7_uxn_opcodes_h_l672_l730_DUPLICATE_11b0_return_output;
     -- Last stage of pipeline return wire to return port/reg
     return_output <= VAR_return_output;
   end if;
 end loop;

-- Write regs vars to comb logic
REG_COMB_t16 <= REG_VAR_t16;
REG_COMB_n16 <= REG_VAR_n16;
REG_COMB_tmp16 <= REG_VAR_tmp16;
REG_COMB_result <= REG_VAR_result;
end process;

-- Register comb signals
process(clk) is
begin
 if rising_edge(clk) then
 if CLOCK_ENABLE(0)='1' then
     t16 <= REG_COMB_t16;
     n16 <= REG_COMB_n16;
     tmp16 <= REG_COMB_tmp16;
     result <= REG_COMB_result;
 end if;
 end if;
end process;

end arch;
