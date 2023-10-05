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
-- Submodules: 65
entity lth_0CLK_7c2e709f is
port(
 clk : in std_logic;
 CLOCK_ENABLE : in unsigned(0 downto 0);
 phase : in unsigned(7 downto 0);
 ins : in unsigned(7 downto 0);
 previous_stack_read : in unsigned(7 downto 0);
 return_output : out opcode_result_t);
end lth_0CLK_7c2e709f;
architecture arch of lth_0CLK_7c2e709f is
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
-- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_3559]
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output : unsigned(0 downto 0);

-- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1717_c1_403c]
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_cond : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iftrue : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iffalse : unsigned(0 downto 0);
signal TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1717_c2_c347]
signal n8_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1717_c2_c347]
signal t8_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1717_c2_c347]
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_c347]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c2_c347]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c2_c347]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_c347]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_c347]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_c347]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);

-- printf_uxn_opcodes_h_l1718_c3_c987[uxn_opcodes_h_l1718_c3_c987]
signal printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987_CLOCK_ENABLE : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1723_c11_9a99]
signal BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_right : unsigned(0 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal n8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal t8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1723_c7_d87e]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1726_c11_9ee8]
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);

-- t8_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
signal t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1726_c7_3ef8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_8dae]
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_right : unsigned(1 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_ccc4]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_93d4]
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output : unsigned(0 downto 0);

-- n8_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(7 downto 0);
signal n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(7 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_is_stack_read_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : signed(7 downto 0);
signal result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : signed(7 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_ca5a]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);

-- BIN_OP_AND[uxn_opcodes_h_l1737_c32_49d3]
signal BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_left : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_right : unsigned(7 downto 0);
signal BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_return_output : unsigned(7 downto 0);

-- BIN_OP_GT[uxn_opcodes_h_l1737_c32_0959]
signal BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_left : unsigned(7 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_right : unsigned(0 downto 0);
signal BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1737_c32_2f42]
signal MUX_uxn_opcodes_h_l1737_c32_2f42_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1737_c32_2f42_iftrue : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1737_c32_2f42_iffalse : signed(7 downto 0);
signal MUX_uxn_opcodes_h_l1737_c32_2f42_return_output : signed(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1739_c11_f600]
signal BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output : unsigned(0 downto 0);

-- result_stack_value_MUX[uxn_opcodes_h_l1739_c7_14c8]
signal result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(7 downto 0);
signal result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(7 downto 0);

-- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1739_c7_14c8]
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(7 downto 0);
signal result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(7 downto 0);

-- result_is_sp_shift_MUX[uxn_opcodes_h_l1739_c7_14c8]
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(0 downto 0);
signal result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1739_c7_14c8]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1739_c7_14c8]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(0 downto 0);

-- BIN_OP_LT[uxn_opcodes_h_l1743_c24_52b7]
signal BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_left : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_right : unsigned(7 downto 0);
signal BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_return_output : unsigned(0 downto 0);

-- MUX[uxn_opcodes_h_l1743_c24_9b3e]
signal MUX_uxn_opcodes_h_l1743_c24_9b3e_cond : unsigned(0 downto 0);
signal MUX_uxn_opcodes_h_l1743_c24_9b3e_iftrue : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1743_c24_9b3e_iffalse : unsigned(7 downto 0);
signal MUX_uxn_opcodes_h_l1743_c24_9b3e_return_output : unsigned(7 downto 0);

-- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_93eb]
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_left : unsigned(7 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_right : unsigned(2 downto 0);
signal BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output : unsigned(0 downto 0);

-- result_is_stack_write_MUX[uxn_opcodes_h_l1745_c7_8aaa]
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse : unsigned(0 downto 0);
signal result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output : unsigned(0 downto 0);

-- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_8aaa]
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse : unsigned(0 downto 0);
signal result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output : unsigned(0 downto 0);

function CONST_REF_RD_opcode_result_t_opcode_result_t_df93( ref_toks_0 : opcode_result_t;
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
      base.stack_value := ref_toks_1;
      base.stack_address_sp_offset := ref_toks_2;
      base.is_sp_shift := ref_toks_3;
      base.is_stack_read := ref_toks_4;
      base.sp_relative_shift := ref_toks_5;
      base.is_stack_write := ref_toks_6;
      base.is_opc_done := ref_toks_7;

      return_output := base;
      return return_output; 
end function;


begin

-- SUBMODULE INSTANCES 
-- BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_left,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_right,
BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output);

-- TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_cond,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iftrue,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iffalse,
TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_return_output);

-- n8_MUX_uxn_opcodes_h_l1717_c2_c347
n8_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
n8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
n8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
n8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- t8_MUX_uxn_opcodes_h_l1717_c2_c347
t8_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
t8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
t8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
t8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347
result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

-- printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987
printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987 : entity work.printf_uxn_opcodes_h_l1718_c3_c987_0CLK_de264c78 port map (
printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987_CLOCK_ENABLE);

-- BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99 : entity work.BIN_OP_EQ_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_left,
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_right,
BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output);

-- n8_MUX_uxn_opcodes_h_l1723_c7_d87e
n8_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
n8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- t8_MUX_uxn_opcodes_h_l1723_c7_d87e
t8_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
t8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e
result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e
result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e
result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8
BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8 : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_left,
BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_right,
BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output);

-- n8_MUX_uxn_opcodes_h_l1726_c7_3ef8
n8_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- t8_MUX_uxn_opcodes_h_l1726_c7_3ef8
t8_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8
result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8
result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae : entity work.BIN_OP_EQ_uint8_t_uint2_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_left,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_right,
BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output);

-- n8_MUX_uxn_opcodes_h_l1730_c7_ccc4
n8_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4
result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4
result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4
result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4
result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_left,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_right,
BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output);

-- n8_MUX_uxn_opcodes_h_l1733_c7_ca5a
n8_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a
result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output);

-- BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3
BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3 : entity work.BIN_OP_AND_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_left,
BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_right,
BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_return_output);

-- BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959
BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959 : entity work.BIN_OP_GT_uint8_t_uint1_t_0CLK_de264c78 port map (
BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_left,
BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_right,
BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_return_output);

-- MUX_uxn_opcodes_h_l1737_c32_2f42
MUX_uxn_opcodes_h_l1737_c32_2f42 : entity work.MUX_uint1_t_int8_t_int8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1737_c32_2f42_cond,
MUX_uxn_opcodes_h_l1737_c32_2f42_iftrue,
MUX_uxn_opcodes_h_l1737_c32_2f42_iffalse,
MUX_uxn_opcodes_h_l1737_c32_2f42_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600 : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_left,
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_right,
BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output);

-- result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8
result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_cond,
result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue,
result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse,
result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output);

-- result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8 : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_cond,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse,
result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output);

-- result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_cond,
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue,
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse,
result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8 : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output);

-- BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7
BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7 : entity work.BIN_OP_LT_uint8_t_uint8_t_0CLK_de264c78 port map (
BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_left,
BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_right,
BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_return_output);

-- MUX_uxn_opcodes_h_l1743_c24_9b3e
MUX_uxn_opcodes_h_l1743_c24_9b3e : entity work.MUX_uint1_t_uint8_t_uint8_t_0CLK_de264c78 port map (
MUX_uxn_opcodes_h_l1743_c24_9b3e_cond,
MUX_uxn_opcodes_h_l1743_c24_9b3e_iftrue,
MUX_uxn_opcodes_h_l1743_c24_9b3e_iffalse,
MUX_uxn_opcodes_h_l1743_c24_9b3e_return_output);

-- BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb : entity work.BIN_OP_EQ_uint8_t_uint3_t_0CLK_de264c78 port map (
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_left,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_right,
BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output);

-- result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond,
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue,
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse,
result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output);

-- result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa : entity work.MUX_uint1_t_uint1_t_uint1_t_0CLK_de264c78 port map (
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse,
result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output);



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
 BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output,
 TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_return_output,
 n8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 t8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output,
 n8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 t8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output,
 n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output,
 n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output,
 n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output,
 BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_return_output,
 BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_return_output,
 MUX_uxn_opcodes_h_l1737_c32_2f42_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output,
 result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output,
 result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output,
 result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output,
 BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_return_output,
 MUX_uxn_opcodes_h_l1743_c24_9b3e_return_output,
 BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output,
 result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output,
 result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output)
is 
 -- All of the wires in function
 variable VAR_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_return_output : opcode_result_t;
 variable VAR_phase : unsigned(7 downto 0);
 variable VAR_ins : unsigned(7 downto 0);
 variable VAR_previous_stack_read : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_return_output : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_cond : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iftrue : unsigned(0 downto 0);
 variable VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iffalse : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_ca53 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_cond : unsigned(0 downto 0);
 variable VAR_printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987_CLOCK_ENABLE : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1724_c3_ac61 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
 variable VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_3706 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_right : unsigned(1 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_57c2 : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond : unsigned(0 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output : unsigned(0 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : signed(7 downto 0);
 variable VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_iftrue : signed(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_iffalse : signed(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_right : unsigned(0 downto 0);
 variable VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_return_output : signed(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output : unsigned(0 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1742_c3_c70f : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(7 downto 0);
 variable VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_cond : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_iftrue : unsigned(7 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_iffalse : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_right : unsigned(7 downto 0);
 variable VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_return_output : unsigned(0 downto 0);
 variable VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_return_output : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_left : unsigned(7 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_right : unsigned(2 downto 0);
 variable VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse : unsigned(0 downto 0);
 variable VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf_return_output : signed(7 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1723_l1733_l1726_l1730_DUPLICATE_e8e9_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output : unsigned(0 downto 0);
 variable VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_l1739_DUPLICATE_5134_return_output : unsigned(7 downto 0);
 variable VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1713_l1750_DUPLICATE_cfc2_return_output : opcode_result_t;
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
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_right := to_unsigned(128, 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_right := to_unsigned(1, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_right := to_unsigned(3, 2);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_3706 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1728_c3_3706;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1742_c3_c70f := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1742_c3_c70f;
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1724_c3_ac61 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1724_c3_ac61;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue := to_unsigned(0, 1);
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_right := to_unsigned(0, 1);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_ca53 := resize(to_unsigned(1, 1), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1720_c3_ca53;
     VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_iftrue := signed(std_logic_vector(resize(to_unsigned(1, 1), 8)));
     VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_iffalse := resize(to_unsigned(0, 1), 8);
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := to_unsigned(1, 1);
     VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_iffalse := resize(to_signed(-1, 2), 8);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_right := to_unsigned(2, 2);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_right := to_unsigned(5, 3);
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iffalse := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_right := to_unsigned(4, 3);
     VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_iftrue := resize(to_unsigned(1, 1), 8);
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := to_unsigned(0, 1);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_right := to_unsigned(6, 3);
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_right := to_unsigned(0, 1);
     VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_57c2 := resize(to_unsigned(2, 2), 8);
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := VAR_result_stack_address_sp_offset_uxn_opcodes_h_l1731_c3_57c2;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := to_unsigned(1, 1);

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
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iftrue := VAR_CLOCK_ENABLE;
     VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_left := VAR_ins;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_left := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := n8;
     VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := n8;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_left := VAR_phase;
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_left := VAR_phase;
     VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := VAR_previous_stack_read;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_previous_stack_read;
     VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_right := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := t8;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := t8;
     -- BIN_OP_EQ[uxn_opcodes_h_l1739_c11_f600] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_left;
     BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output := BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_l1739_DUPLICATE_5134 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_l1739_DUPLICATE_5134_return_output := result.stack_address_sp_offset;

     -- BIN_OP_EQ[uxn_opcodes_h_l1717_c6_3559] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_left;
     BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output := BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output := result.is_opc_done;

     -- BIN_OP_EQ[uxn_opcodes_h_l1723_c11_9a99] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_left;
     BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output := BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;

     -- CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164 LATENCY=0
     VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output := result.stack_value;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1723_l1733_l1726_l1730_DUPLICATE_e8e9 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1723_l1733_l1726_l1730_DUPLICATE_e8e9_return_output := result.is_stack_read;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893_return_output := result.is_sp_shift;

     -- BIN_OP_EQ[uxn_opcodes_h_l1745_c11_93eb] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_left;
     BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output := BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1726_c11_9ee8] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_left;
     BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output := BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1730_c11_8dae] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_left;
     BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output := BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;

     -- BIN_OP_EQ[uxn_opcodes_h_l1733_c11_93d4] LATENCY=0
     -- Inputs
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_left <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_left;
     BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_right <= VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_right;
     -- Outputs
     VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output := BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;

     -- BIN_OP_AND[uxn_opcodes_h_l1737_c32_49d3] LATENCY=0
     -- Inputs
     BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_left <= VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_left;
     BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_right <= VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_right;
     -- Outputs
     VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_return_output := BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_return_output;

     -- CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27 LATENCY=0
     VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output := result.is_stack_write;

     -- BIN_OP_LT[uxn_opcodes_h_l1743_c24_52b7] LATENCY=0
     -- Inputs
     BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_left <= VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_left;
     BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_right <= VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_right;
     -- Outputs
     VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_return_output := BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_return_output;

     -- CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf LATENCY=0
     VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf_return_output := result.sp_relative_shift;

     -- Submodule level 1
     VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_left := VAR_BIN_OP_AND_uxn_opcodes_h_l1737_c32_49d3_return_output;
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1717_c6_3559_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1723_c11_9a99_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1726_c11_9ee8_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1730_c11_8dae_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1733_c11_93d4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1739_c11_f600_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond := VAR_BIN_OP_EQ_uxn_opcodes_h_l1745_c11_93eb_return_output;
     VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_cond := VAR_BIN_OP_LT_uxn_opcodes_h_l1743_c24_52b7_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := VAR_CONST_REF_RD_int8_t_opcode_result_t_sp_relative_shift_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_DUPLICATE_5cbf_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_opc_done_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1745_l1739_DUPLICATE_f2a4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_sp_shift_d41d_uxn_opcodes_h_l1730_l1726_l1723_l1717_l1739_DUPLICATE_0893_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1723_l1733_l1726_l1730_DUPLICATE_e8e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1723_l1733_l1726_l1730_DUPLICATE_e8e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1723_l1733_l1726_l1730_DUPLICATE_e8e9_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_read_d41d_uxn_opcodes_h_l1723_l1733_l1726_l1730_DUPLICATE_e8e9_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse := VAR_CONST_REF_RD_uint1_t_opcode_result_t_is_stack_write_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1745_DUPLICATE_4f27_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_l1739_DUPLICATE_5134_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_address_sp_offset_d41d_uxn_opcodes_h_l1733_l1739_DUPLICATE_5134_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse := VAR_CONST_REF_RD_uint8_t_opcode_result_t_stack_value_d41d_uxn_opcodes_h_l1733_l1730_l1726_l1723_l1717_l1739_DUPLICATE_b164_return_output;
     -- BIN_OP_GT[uxn_opcodes_h_l1737_c32_0959] LATENCY=0
     -- Inputs
     BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_left <= VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_left;
     BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_right <= VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_right;
     -- Outputs
     VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_return_output := BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1745_c7_8aaa] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output;

     -- MUX[uxn_opcodes_h_l1743_c24_9b3e] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1743_c24_9b3e_cond <= VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_cond;
     MUX_uxn_opcodes_h_l1743_c24_9b3e_iftrue <= VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_iftrue;
     MUX_uxn_opcodes_h_l1743_c24_9b3e_iffalse <= VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_return_output := MUX_uxn_opcodes_h_l1743_c24_9b3e_return_output;

     -- t8_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1745_c7_8aaa] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output;

     -- TRUE_CLOCK_ENABLE_MUX[uxn_opcodes_h_l1717_c1_403c] LATENCY=0
     -- Inputs
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_cond <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_cond;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iftrue <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iftrue;
     TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iffalse <= VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_iffalse;
     -- Outputs
     VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_return_output := TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1739_c7_14c8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;

     -- n8_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1739_c7_14c8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- Submodule level 2
     VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_cond := VAR_BIN_OP_GT_uxn_opcodes_h_l1737_c32_0959_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue := VAR_MUX_uxn_opcodes_h_l1743_c24_9b3e_return_output;
     VAR_printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987_CLOCK_ENABLE := VAR_TRUE_CLOCK_ENABLE_MUX_uxn_opcodes_h_l1717_c1_403c_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1745_c7_8aaa_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     -- result_stack_value_MUX[uxn_opcodes_h_l1739_c7_14c8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;

     -- t8_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := t8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- n8_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- printf_uxn_opcodes_h_l1718_c3_c987[uxn_opcodes_h_l1718_c3_c987] LATENCY=0
     -- Clock enable
     printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987_CLOCK_ENABLE <= VAR_printf_uxn_opcodes_h_l1718_c3_c987_uxn_opcodes_h_l1718_c3_c987_CLOCK_ENABLE;
     -- Inputs
     -- Outputs

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1739_c7_14c8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- MUX[uxn_opcodes_h_l1737_c32_2f42] LATENCY=0
     -- Inputs
     MUX_uxn_opcodes_h_l1737_c32_2f42_cond <= VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_cond;
     MUX_uxn_opcodes_h_l1737_c32_2f42_iftrue <= VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_iftrue;
     MUX_uxn_opcodes_h_l1737_c32_2f42_iffalse <= VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_iffalse;
     -- Outputs
     VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_return_output := MUX_uxn_opcodes_h_l1737_c32_2f42_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1739_c7_14c8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;

     -- Submodule level 3
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue := VAR_MUX_uxn_opcodes_h_l1737_c32_2f42_return_output;
     VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1739_c7_14c8_return_output;
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_t8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- n8_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1733_c7_ca5a] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;

     -- t8_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     t8_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     t8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     t8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := t8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- Submodule level 4
     VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1733_c7_ca5a_return_output;
     REG_VAR_t8 := VAR_t8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;
     -- n8_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := n8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_is_stack_read_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1730_c7_ccc4] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output := result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;

     -- Submodule level 5
     VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_n8_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1730_c7_ccc4_return_output;
     -- result_is_stack_read_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- n8_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     n8_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     n8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     n8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := n8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1726_c7_3ef8] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;

     -- Submodule level 6
     REG_VAR_n8 := VAR_n8_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1726_c7_3ef8_return_output;
     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- result_is_sp_shift_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- result_is_opc_done_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- result_stack_address_sp_offset_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1723_c7_d87e] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;

     -- Submodule level 7
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse := VAR_result_stack_value_MUX_uxn_opcodes_h_l1723_c7_d87e_return_output;
     -- result_is_opc_done_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- result_stack_value_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- result_is_stack_write_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- result_sp_relative_shift_MUX[uxn_opcodes_h_l1717_c2_c347] LATENCY=0
     -- Inputs
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_cond;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iftrue;
     result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse <= VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_iffalse;
     -- Outputs
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output := result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output;

     -- Submodule level 8
     -- CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1713_l1750_DUPLICATE_cfc2 LATENCY=0
     VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1713_l1750_DUPLICATE_cfc2_return_output := CONST_REF_RD_opcode_result_t_opcode_result_t_df93(
     result,
     VAR_result_stack_value_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
     VAR_result_stack_address_sp_offset_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
     VAR_result_is_sp_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
     VAR_result_is_stack_read_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
     VAR_result_sp_relative_shift_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
     VAR_result_is_stack_write_MUX_uxn_opcodes_h_l1717_c2_c347_return_output,
     VAR_result_is_opc_done_MUX_uxn_opcodes_h_l1717_c2_c347_return_output);

     -- Submodule level 9
     REG_VAR_result := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1713_l1750_DUPLICATE_cfc2_return_output;
     VAR_return_output := VAR_CONST_REF_RD_opcode_result_t_opcode_result_t_df93_uxn_opcodes_h_l1713_l1750_DUPLICATE_cfc2_return_output;
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
